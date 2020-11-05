#!/bin/bash

#### utilitaire pour upkg ####
# - récupère la valeur du groupe et execute upkg_client si 
# - récupère le groupe machine depuis une liste csv dans r:\icones et modifie le groupe du pc
# nul si le fichier liste_pc_esu.csv n'existe pas
# - ver 2.0.3
# - 05 novembre 2020
# - CALPETARD Olivier



#administratif = 10000
#prof = 10001
#eleve = 10002
groupe=$GROUPS


if [ groupe=10000 ] || [ groupe=10001 ] || [ groupe=10002 ]
then
echo "ok"

 #controle de la présence du fichier liste_pc.csv dans icones qui sert de référence 
 	echo "controle presense liste_pc_esu.csv dans icones";
 	if [ -f /tmp/netlogon/icones/liste_pc_esu.csv ]
	then 
	echo "La liste des pc existe"
	#recherche nom du pc et son groupe dans le fichier

	salle=$(grep $HOSTNAME /tmp/netlogon/icones/liste_pc_esu.csv | awk -F';' ' {gsub("\r","",$2); printf $2 } ' )
	
	if [ -z "$salle" ]
	then
	echo "le pc n'exite pas dans la liste"
	salle=grp_eole
	else
	salle=$salle
	fi

	gm_esu=$(cat /etc/GM_ESU)

		if [ $gm_esu != $salle ]
		then

		echo "$salle"
		echo "$salle" > /etc/GM_ESU
		sudo rm /usr/local/upkg_client/stamp.date

#firefox

gm_esu=$(cat /etc/GM_ESU)
echo '//
lockPref("autoadmin.global_config_url", "file:///tmp/netlogon/icones/'$gm_esu'/linux/firefox.js"); '> /usr/lib/firefox/firefox.cfg
		else
		echo meme groupe on ne fait rien
		fi
	else 
	echo "La liste des pc n'existe pas"
	#on ne tiens pas compte des groupes esu par rapport au fichier
	fi
#execution de upkg

 sudo sh /etc/esubuntu/upkg_client.sh
else 

echo  "pas ok"
	exit 0
fi

exit 0
