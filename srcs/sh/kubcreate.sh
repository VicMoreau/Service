if [ $clean = 'ok' ]
then
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f srcs/configmap.yaml
    kubectl apply -f srcs/nginx/nginx.yaml
    kubectl apply -f srcs/wordpress/wordpress.yaml
    kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
    kubectl apply -f srcs/mysql/mysql.yaml
    kubectl apply -f srcs/ftps/ftps.yaml
    kubectl apply -f srcs/grafana/grafana.yaml
    echo "\n\033[5;92mREADY TO RUN FT_SERVICES\033[0m\n"
else
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null ; echo -n "\033[42m\033[32m..."
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null ; echo -n ...
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null ; echo -n ...
    kubectl apply -f srcs/configmap.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/nginx/nginx.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/wordpress/wordpress.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/mysql/mysql.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/ftps/ftps.yaml > /dev/null ; echo -n ...
    kubectl apply -f srcs/grafana/grafana.yaml > /dev/null ; echo ".\033[0m \033[1;32m Done ✔\033[0m\n"
    echo "\033[5;92mREADY TO RUN FT_SERVICES\033[0m\n"
fi
echo "\033[1;34mIf you want the dashboard run:\033[0m \033[4;34mminikube dashboard\033[0m\n"
echo "\033[1;34mCheck NGINX page to get all login:\033[0m \033[4;34mhttp://172.17.0.220\033[0m\n"