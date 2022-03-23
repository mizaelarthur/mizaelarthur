#!/bin/bash

RESULTADO=`cat /etc/passwd | cut -d : -f 1,3`
for i in $RESULTADO
    do
        FORMATADO=(${i//:/ })
        echo "${FORMATADO[1]} ${FORMATADO[0]}"
done