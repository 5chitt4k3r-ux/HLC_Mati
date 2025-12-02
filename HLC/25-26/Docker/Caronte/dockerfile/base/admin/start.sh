#!/bin/bash
# Carga las variables de entornos
set -e

source /root/admin/base/usuarios/mainUsuarios.sh
source /root/admin/base/ssh/mainSSH.sh

main(){
	touch /root/logs/informe.log
	newUser
	configurar_ssh
	configurar-sudo
	#Encargada de dejar el contenedor vivo en BG
	# tail -f /dev/null
	# Scripts que se encargan de configurar la imgaen/contenedor
}

main