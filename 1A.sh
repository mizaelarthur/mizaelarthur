#!/bin/bash

RESULTADO=`cat /etc/passwd | cut -d : -f 1,3`
for i in $RESULTADO
do
	FORMATADO=(${i//:/ })
	ARRAY+="${FORMATADO[1]} ${FORMATADO[0]} \n"
done

echo -e $ARRAY | sort -k 1n | rev |  uniq -D -f1 | rev