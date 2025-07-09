# Detailed App in container pod
## How to run?
kubectl apply -f details_app.yaml
kubectl get pods -o wide

__See which IP is open for details-app-pod pod__
curl http://10.42.0.22:8020/deda

