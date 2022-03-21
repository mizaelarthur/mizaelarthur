#!/bin/bash
#Adquirindo data e hora
DATA=$(date +"%d/%m/%y")
HORA=$(date +"%H:%M:%S")

#Introdução para inserção e leitura de dados
USERID=$(cat /etc/passwd)

echo USERID
#Verificando se usuario existe
#if [ "$(cat /etc/passwd| grep -i $LOGIN| wc -l)" = "1" ]; then
#    echo "Usuário já cadastrado"