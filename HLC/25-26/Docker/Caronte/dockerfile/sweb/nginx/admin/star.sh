#!/bin/bash

load_entrypoint_base() {
    bash /root/admin/base/start.sh
}

reiniciar_nginx() {
    echo "Configurando Nginx..." >> /root/logs/informe_nginx.log
# Reiniciar el servicio de Nginx para aplicar los cambios
    if service nginx restart; then
        echo "Nginx reiniciado" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se pudo reiniciar Nginx" >> /root/logs/informe_nginx.log
    fi
# Detener el servicio de Nginx para evitar que se ejecute en segundo plano
    if service nginx stop; then
       echo "Nginx detenido" >> /root/logs/informe_nginx.log
    else
       echo "ERROR: No se pudo detener Nginx" >> /root/logs/informe_nginx.log
    fi
}


main() {
    mkdir -p /root/logs
    touch /root/logs/informe_nginx.log
    load_entrypoint_base
    reiniciar_nginx
    #tail -f /dev/null
}

main

