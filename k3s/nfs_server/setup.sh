#!/usr/bin/env bash 

############## Start Safe Header ###########################
#Develop by: Baruch Gudesblat
#Purpose: NFS server setup under K3S based container + PV
#Date: 10/07/2025
#Version: 1.0.0
############### End Safe Header ##########################

set -o errexit
set -o pipefail


function main(){
    sudo install_nfs
    clear_k3s_resources
    create_nfs_server
    test_nfs_server
}

function create_nfs_server(){
    kubectl create configmap --from-file=yaml/nginx-custom.conf nginx-custom-config 
    kubectl apply -f yaml/nfs-pv.yaml -f yaml/nfs-pvc.yaml -f nginx-nfs.yaml
}

function test_nfs_server(){
}

function install_nfs(){
    apt update
    apt install nfs-service
    cat << EOI > /etc/exports
/home/nfs/storage    127.0.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.7.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.8.0.1/8(rw,no_root_squash)
/home/nfs/storage    127.9.0.1/8(rw,no_root_squash)
EOI
    exportfs -av
}

# Verify the k3s clearance
function clear_k3s_resources(){
set +o errexit
kubectl delete pv  nfs-pv
kubectl delete pvc nfs-pvc
kubectl delete configmap nginx-custom-config
kubectl delete deploy nginx-nfs
set -o errexit
}

#-----------------------------------------------

main "$@"
