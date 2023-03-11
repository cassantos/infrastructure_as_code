#==============================================================================================#
#!/bin/bash
#Padronização de configuração de servidores usando IaC
#Ao executar esse script, forneça a senha inicial dos usuários: Ex.: $./setupemp.sh SenhaTmp&
#==============================================================================================#
if [ $# -eq 0 ]; then
  echo "setupemp (erro): Informe a senha incial para criação dos usuários. Ex.: "
  echo "$./setupemp.sh SenhaTmp&"
  exit 1
fi

echo "Iniciando configuração"
echo ""
echo "Criando as pastas..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando os grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os usuários..."
useradd carlos -m -c "Carlos Augusto da Silva" -s /bin/bash -p $(openssl passwd -crypt $1)
useradd maria  -m -c "Maria Alcântara"         -s /bin/bash -p $(openssl passwd -crypt $1)
useradd joao   -m -c "João Joarez"             -s /bin/bash -p $(openssl passwd -crypt $1)

useradd  debora     -m -c "Debora Oliveria"    -s /bin/bash -p $(openssl passwd -crypt $1)
useradd  sebastiana -m -c "Sebastina Santana"  -s /bin/bash -p $(openssl passwd -crypt $1)
useradd  roberto    -m -c "Roberto Ferraz"     -s /bin/bash -p $(openssl passwd -crypt $1)

useradd  josefina -m -c  "Josefina Fagundes"   -s /bin/bash -p $(openssl passwd -crypt $1)
useradd  amanda   -m -c  "Amanda Mercedez"     -s /bin/bash -p $(openssl passwd -crypt $1)
useradd  rogerio  -m -c  "Rogério Ruffino"     -s /bin/bash -p $(openssl passwd -crypt $1)

echo "Atribuindo usuários aos grupos..."
adduser carlos     GRP_ADM
adduser maria      GRP_ADM
adduser joao       GRP_AMD
adduser debora     GRP_VEN
adduser sebastiana GRP_VEN
adduser roberto    GRP_VEN
adduser josefina   GRP_SEC
adduser amanda     GRP_SEC
adduser  rogerio   GRP_SEC

echo "Alterando permissões das pastas..."
chmod 777 /publico
chmod 770 /adm
chmod 770 /sec
chmod 770 /ven
chgrp GRP_ADM /adm
chgrp GRP_VEN /ven
chgrp GRP_SEC /sec

echo "Configuração concluída!"



