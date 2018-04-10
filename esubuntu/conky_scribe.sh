#!/bin/bash
#### partie de configuration de conky ####
# - récupère la valeur du groupe et attribut en fonction les fond ecran 
# - ver 1.0.0
# - 03 Avril 2017
# - CALPETARD Olivier - AMI - lycee Antoine ROUSSIN
# - le fichiers conf de conky se trouve dans icone/postelinux/conky/conky.cfg

gm_esu=grp_eole
if [ -f "/etc/GM_ESU" ];then

gm_esu=$(cat /etc/GM_ESU)
fi

#administratif = 10000 prof = 10001 eleve = 10002
sleep 3
if [ $GROUPS -eq 10000 ]
 then
   variable=Admin

elif [ $GROUPS -eq 10001 ]
 then
   variable=Prof

elif [ $GROUPS -eq 10002 ]
 then
   variable=Eleve

else [ $GROUPS -lt 10000 ]
	variable=Local
fi

echo  Bureau : $variable
echo -e " \t Groupe : $gm_esu"
exit 0
