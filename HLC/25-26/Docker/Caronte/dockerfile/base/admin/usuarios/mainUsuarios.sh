check_usuario(){
	if grep -q "${USUARIO}" /etc/passwd
	then
		echo "${USUARIO} se encuentra en el sistema" >> /root/logs/informe.log
		retrun 1
	else
		echo "${USUARIO} no se encuentra en el sistema" >> /root/logs/informe.log
		return 0
	fi
}

newUser(){
	check_usuario
	if [ "$?" -eq 0 ]
	then
		useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
		echo "${USUARIO}:1234" | chpasswd
		echo "Willkommen ${USUARIO}s..." > /home/${USUARIO}/Willkommen.txt
	fi
}
