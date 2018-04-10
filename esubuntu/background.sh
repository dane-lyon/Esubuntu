#!/bin/bash

#### changement de fond ecran ouverture de session ubuntu ####
# - récupère la valeur du groupe et attribut en fonction les fond ecran génére par esu
# - gestion des restriction gsetting
# - ver 2.0.1
# - 20 mars 2018
# - CALPETARD Olivier

#les fichiers se trouvent dans icones$ 
#lecture du groupe ESU
gm_esu=grp_eole

if [ -f "/etc/GM_ESU" ];then
echo "Le PC est dans le groupe esu"
gm_esu=$(cat /etc/GM_ESU)
fi



#administratif = 10000
#prof = 10001
#eleve = 10002
sleep 3

#lecture parametres utilisateur



if [ $GROUPS -eq 10000 ]
then
   variable=Admin
cp /tmp/netlogon/icones/$gm_esu/_Machine/Bureau/*.desktop  /$HOME/Desktop/
cp /tmp/netlogon/icones/$gm_esu/administratifs/Bureau/*.desktop  /$HOME/Desktop/
chmod +x /$HOME/Desktop/*.desktop

elif [ $GROUPS -eq 10001 ]
then
   variable=Prof
cp /tmp/netlogon/icones/$gm_esu/_Machine/Bureau/*.desktop  /$HOME/Desktop/
cp /tmp/netlogon/icones/$gm_esu/professeurs/Bureau/*.desktop  /$HOME/Desktop/
chmod +x /$HOME/Desktop/*.desktop

elif [ $GROUPS -eq 10002 ]
then
   variable=Eleve
cp /tmp/netlogon/icones/$gm_esu/_Machine/Bureau/*.desktop  /$HOME/Desktop/
cp /tmp/netlogon/icones/$gm_esu/eleves/Bureau/*.desktop  /$HOME/Desktop/
chmod +x /$HOME/Desktop/*.desktop
else [ $GROUPS -lt 10000 ]
 gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Images/images.jpg"

exit 0
fi



wallpaper=$(cat /tmp/netlogon/icones/$gm_esu/$variable.txt)

#pour ubuntu mate
if [ "$XDG_CURRENT_DESKTOP" = "Mate" ] ; then
   gsettings set org.mate.background picture-filename "file:///"$wallpaper""
   else
   gsettings set org.gnome.desktop.background picture-uri "file:///"$wallpaper""
fi

#lancement de conky avec lecture du fichier de conf
conky -c /tmp/netlogon/icones/posteslinux/conky/conky.cfg

#lancement du gpo lecture fichier txt dans gset du groupe esu
#determine l interface

interface=gset_$XDG_CURRENT_DESKTOP

#on lit le fichier gset en fonction de la session
while read gio  
do   
$gio 
done < /tmp/netlogon/icones/$gm_esu/linux/gset/$interface.txt


exit 0
