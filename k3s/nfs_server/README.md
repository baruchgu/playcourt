# NFS server by K3S deployment
## 📌 Project Overview
The project demonstrates all steps to build NFS server in K3S managed container.  

## Deployment parts
The deploy consists of 
- build PV, PVC and ConfigMap resources
- open NFS server
- open nginx container with replicas and config file mounted to NFS folder
- test the nginx output
## Pre-requirements
The script installs the following apt packages by sudo permissions:
- nfs-server
- curl

## 👣 Steps
The script runs as a non-root user, but uses sudo for pre-requrenments installation
- install apr packages
- clean pv, pvc, configmap and deploy if remines from prev runs
- create deployment
- test the correct output from all replicas
 
## 🛠️ Usage
Download the repository. Run the script as a non-root user:
```sh
bash setup.sh
```

## 📁 Folder Structure
<details><summary></summary>

📁 <span style="display: inline-block; margin-right: 20px;">[nfs_server/](./)</span> Root directory   
  - 📄 <span style="display: inline-block; margin-right: 20px;">[README.md](./README.md)</span> Project overview  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[TASK.md](./TASK.md)</span> The task description  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[LICENSE](./LICENSE)</span> MIT License note  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[CONTRIBUTORS](./CONTRIBUTORS.md)</span>   
  - 📜 <span style="display: inline-block; margin-right: 20px;">[setup.sh](./setup.sh)</span> Main deployment script  
  - 📂 <span style="display: inline-block; margin-right: 20px;">[yaml](./yaml)</span> Yaml and config files from deployment  
    - 📜 <span style="display: inline-block; margin-right: 20px;">[nginx-custom.conf](./nginx-custom.conf)</span> NGINX server config file  
    - 📜 <span style="display: inline-block; margin-right: 20px;">[nfs-pv.yaml](./nfs-pv.yaml)</span> PersistentVolume yaml  
    - 📜 <span style="display: inline-block; margin-right: 20px;">[nfs-pvc.yaml](./nfs-pvc.yaml)</span> PersistentVolumeClaim yaml  
    - 📜 <span style="display: inline-block; margin-right: 20px;">[nginx-nfs.yaml](./nginx-nfs.yaml)</span> Main deployment yaml  

</details>


## 👥 Contributor
[Baruch.G](https://github.com/baruchgu)

## License
This project is for personal use and learning. Refer to the [License](./LICENSE) for more details.

