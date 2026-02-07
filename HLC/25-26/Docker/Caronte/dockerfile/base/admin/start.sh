#!/bin/bash
set -e

source /root/admin/base/usuarios/mainUsuarios.sh
source /root/admin/base/ssh/ssh.sh
source /root/admin/base/sudo/mainSudo.sh

main(){
    # Gestión de usuario --> getuser.sh
    # Gestión del sudo --> getsudo.sh
    # ...
    mkdir -p /root/logs
    touch /root/logs/informe.log
    newUser
    resuser=$?
    if [ "$resuser" -eq 0 ]; then
        config_sudoers
    fi
    if [ "$resuser" -eq 0 ]; then
        config_ssh
    fi

    # Encargada de mantener el contenedor en ejecución de Background
    #tail -f /dev/null   
}

main
