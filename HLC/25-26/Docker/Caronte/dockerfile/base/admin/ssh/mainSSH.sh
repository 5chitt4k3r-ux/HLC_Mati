#!/bin/bash
set -e
configurar-ssh(){
    sed -i 's/#Port 22/Port 2345/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /
    if [ ! -d /home/${USUARIO}/.ssh ]
    #then
    mkdir /home/${USUARIO}/.ssh
    cat /root/base/admin/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    #fi
    #exec /usr/sbin/bind -D &
}

configurar-sudo() {
    if [ -f /etc/sudores ]
    then
        echo "${USUARIOS} ALL=(ALL:ALL) ALL" >> /etc/sudores
    fi
}