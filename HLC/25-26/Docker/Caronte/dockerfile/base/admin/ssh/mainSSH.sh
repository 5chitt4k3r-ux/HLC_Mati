#!/bin/bash
set -e
configurar_ssh() {
  # 1. Deshabilitar el login de root
  sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  # 2. Cambiar el puerto de SSH
  sed -i 's/#Port.*/Port 2345/' /etc/ssh/sshd_config
    #4 Reinicar el servicio SSH para que se aplique las configuraciones
  service ssh restart # ESTO DARÁ PROBLEMAS A FUTURO POR LO QUE USAREMOS EL QUE HAY COMENTADO ABAJO
  # /etc/init.d/ssh start
  # exec /usr/sbin/sshd -D & # dejar el ssh en background PARA CUANDO LO IMPLEMENTOS EN UN SERVICIO
  mkdir /home/${USUARIO}/.ssh
  cat /root/admin/base/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
}
configurar-sudo() {
    if [ -f /etc/sudores ]
    then
        echo "${USUARIOS} ALL=(ALL:ALL) ALL" >> /etc/sudores
    fi
}