#!/bin/bash
config_ssh() {
  # 1. Deshabilitar el login de root
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  # 2. Cambiar el puerto de SSH
  sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

  mkdir -p /home/${USUARIO}/.ssh
    if [ -f /root/admin/base/common/id_rsa.pub ]; then
    cat /root/admin/base/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    echo "Clave SSH añadida" >> /root/logs/informe.log
  fi

    #4 Reinicar el servicio SSH para que se aplique las configuraciones
  service ssh restart # ESTO DARÁ PROBLEMAS A FUTURO POR LO QUE USAREMOS EL QUE HAY COMENTADO ABAJO
  # /etc/init.d/ssh start
  # exec /usr/sbin/sshd -D & # dejar el ssh en background PARA CUANDO LO IMPLEMENTOS EN UN SERVICIO
  exec /usr/sbin/sshd -D &
}

config_sudoers() {
    if [ -f /etc/sudoers ]
    then
        echo "${USUARIOS} ALL=(ALL:ALL) ALL" >> /etc/sudoers
    fi
}

newSSH() {
  config_sudoers
  config_ssh
} 