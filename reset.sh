kubectl delete deployments --all
kubectl delete service --all
kubectl delete namespaces metallb-system
docker rmi -f my-nginx alpine
# sh srcs/sh/cleanssh.sh