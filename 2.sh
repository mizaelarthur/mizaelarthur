print_ipv4() {
for P in 6 4 2 0:
do
   echo -n $((16#${1:$P:2}))
done
}

opcao_1(){
sudo awk 'BEGIN{ RS = "" ; FS = "\n" }{print $4 ,$5 ,$8 , $9, $13}' /proc/cpuinfo
}

opcao_2(){
sudo awk 'BEGIN{ RS = "" ; FS = "\n" }{print $1 ,$2,cd }' /proc/meminfo
}
opcao_3(){
sudo cat /proc/version
}

opcao_4(){
ls -d /proc/*[0-9] | wc -l
}

opcao_5(){
DIRETORIOS='ls -d /proc/*[0-9]'
MEMORIAS=()

for i in $DIRETORIOS
do
    if [[ "$i" == *"proc"* ]]; then
    echo `cat ${i}/status | sed -n '1p;6p;18p'`
    echo
    fi
done

echo $MEMORIAS | sort -n -r
}

opcao_6(){
sudo cat /proc/net/fib_trie | grep -B 1 /32
}

opcao_7(){
sudo route -n
}

menu_principal() {
   echo -ne "
MENU DE INFORMAÇÕES
1) Informações da CPU (nome, frequência, etc)
2) Informações sobre a memória total, usada e disponível
3) Informações sobre o sistema operacional
4) Número de processos em execução
5) Dez processos com mais uso de memória (pid nome mem)
6) Endereços IPv4 da máquina
7) A tabela de rotas IPV4 (destino/mascara -> gateway)
0) Sair
Digite sua opção:  "
   read -r opcao
   case $opcao in
   1)
       opcao_1
       ;;
   2)
       opcao_2
       ;;
   3)
       opcao_3
       ;;
   4)
       opcao_4
       ;;
   5)
       opcao_5
       ;;
   6)
       opcao_6
       ;;
   7)
       opcao_7
       ;;
   0)
       echo "Até logo."
       exit 0
       ;;
   *)
       echo "Esta opção não existe"
       exit 1
       menu_principal
       ;;
   esac
}

menu_principal
