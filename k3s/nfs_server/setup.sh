#!/usr/bin/env bash 
######################################################
#Developed by: Baruch Gudesblat
#Purpose: NFS server setup under K3S based container + PV
#Date: 10/07/2025
#Version: 1.0.0
######################################################

set -o errexit
set -o pipefail


function main(){
    install_nfs
    clear_k3s_resources
    create_nfs_server
    test_nfs_server
}


function install_nfs(){
    sudo apt update
    sudo apt install nfs-server curl -y
    cat << EOI | sudo tee /etc/exports
/home/nfs/storage    127.0.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.7.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.8.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.9.0.1/8(rw,no_root_squash)
EOI
    sudo exportfs -av
}


# Verify the k3s clearance
function clear_k3s_resources(){
    if [[ $(kubectl get deploy nginx-nfs -o name) == deployment.apps/nginx-nfs ]]; then
        kubectl delete deploy nginx-nfs
    fi
    if [[ $(kubectl get configmap nginx-custom-config -o name) == configmap/nginx-custom-config ]]; then
        kubectl  delete configmap nginx-custom-config
    fi
    if [[ $(kubectl get pvc nfs-pvc -o name) == persistentvolumeclaim/nfs-pvc ]]; then
        kubectl  delete pvc nfs-pvc
    fi
    if [[ $(kubectl get pv nfs-pv -o name) == persistentvolume/nfs-pv ]]; then
        kubectl  delete pv nfs-pv
    fi
}


function create_nfs_server(){
    kubectl create configmap --from-file=yaml/nginx-custom.conf nginx-custom-config 
    kubectl apply -f yaml/nfs-pv.yaml -f yaml/nfs-pvc.yaml -f yaml/nginx-nfs.yaml

    # Wait all replicas are up
    while true; do
        status=$(kubectl get deploy nginx-nfs -o json)
        replicas=$(echo "$status" | jq '.status.replicas // 0')
        readyReplicas=$(echo "$status" | jq '.status.readyReplicas // 0')
        echo "Ready: $readyReplicas / $replicas"
    
        if [[ "$replicas" -eq "$readyReplicas" && "$replicas" -gt 0 ]]; then
            echo "All replicas are ready."
            break
        fi
        echo "Waiting for replicas to be ready..."
        sleep 5
    done
}



# Test that all replicas the return correct output
function test_nfs_server(){
    str="My PID is = $$"
    echo $str | sudo tee /home/nfs/storage/index.html > /dev/null
    for ip in $(kubectl get pods -o custom-columns=IP:.status.podIP --no-headers); do
	if [[ $(curl -s http://$ip) != $str ]]; then
	   echo "IP $ip does not return correct output"
	   exit 2
	fi
    done
}


#-----------------------------------------------

main "$@"
