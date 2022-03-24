#!/bin/bash
#awk -F: '{print $3 " " $1}' /etc/passwd >> dados.txt
#cat dados.txt | perl -e 'foreach $Line (<STDIN>) 
##{ @Cols=($Line=~/^\s*(\d+)\s*(.*?)\s*$/); push(@{$Link{$Cols[0]}}, $Cols[1]); } 
#foreach $List (values %Link) 
##{ print join("\t", @{$List})."\n"; }'

RESULTADO=`cat /etc/passwd | cut -d : -f 1,3`
for i in $RESULTADO
    do
        FORMATADO=(${i//:/ })

        ATPRIM="${FORMATADO[1]}"

        while read ATPRIM
        do
	        PRIM=${P:0:1}
	        if [ $PRIM != $ATPRIM ]
	        then
		        echo ""
		        #$ATPRIM-$PRIM
	        fi
	        echo -n $ATPRIM
     
        done
    done
done