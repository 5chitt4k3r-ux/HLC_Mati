#!/bin/bash

load_entrypoint_nginx(){
    bash /root/admin/nginx/star.sh
}
reload_nginx(){
    nginx -t
    service nginx reload
    nginx -g "daemon off;"
}
main(){
    load_entrypoint_nginx
    reload_nginx
}

main