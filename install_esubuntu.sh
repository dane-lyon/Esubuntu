#!/bin/bash


#### installation et complement script dane de lyon ####
# - installation du pc dans un groupe et gestion proxy authentifie
# - ver 2.0.2
# - 20 Mars 2018
# - CALPETARD Olivier - AMI - lycee Antoine ROUSSIN

#############################################
# Run using sudo, of course.
#############################################
if [ "$UID" -ne "0" ]
then
  echo "Il faut etre root pour executer ce script. ==> sudo "
  exit 
fi 


#creation du dossier upkg et esubuntu
sudo mkdir /usr/local/upkg_client/
sudo mkdir /etc/esubuntu/

sudo chmod 777 /usr/local/upkg_client

#installation de cntlm zenity et conky
sudo apt-get install cntlm zenity conky

#configuration de cntlm système pour ne pas faire d'interférence avec celui de lutilisateur
#mais je pense que l'on peut lenlever du systeme demarrage
# a modifier
echo "Username	admin
Domain		SCRIBE
Auth	LM
Proxy		172.18.40.1:3128
NoProxy		localhost, 127.0.0.*, 172.18.*
Listen		3129" > /etc/cntlm.conf


#on lance la copie des fichier

sudo cp ./esubuntu/* /etc/esubuntu/
sudo chmod +x /etc/esubuntu/*.sh
sudo cp ./xdg_autostart/* /etc/xdg/autostart/
sudo chmod +x /etc/xdg/autostart/cntlm.desktop
sudo chmod +x /etc/xdg/autostart/message_scribe.desktop
sudo chmod +x /etc/xdg/autostart/scribe_background.desktop
sudo chmod 755 /etc/esubuntu/param_etab.conf

#on lance la gestion du groupe
#salle du pc
echo "Entrez le groupe ESU (salle): "
read salle

echo "$salle" > /etc/GM_ESU

#on lance le script prof_firefox en mode sudo 
sudo ./firefox/prof_firefox.sh

#on inscrit la tache upkg dans crontab
#avant je fesait sudo crontab -e

echo "*/15 *  * * * root /etc/esubuntu/groupe.sh" > /etc/crontab

echo "C'est fini ! bienvenue dans le groupe $salle..."
exit



echo "C'est fini ! 

Pour compléter le système installer un serveur apt-cacher et un poste pour gérer les impressions des autre"
exit
