#!/usr/bin/env bash
# Created by Manfred - 29.08.2025 05:28 Uhr

clear
echo Hier ein lokales Verzeichnis oder ein Mountpoint eintragen(ohne / am Ende!)
read -p 'Das Arbeiits-Verzeichnis bitte: ' WDIR 
#sudo mkdir $WDIR; sudo chown $USER: $WDIR;
#cp -fv .env docker-compose.yml install.sh $WDIR
clear

cat<<ende
Nun folgende Befehle ausführen:

In der Datei: $WDIR/.env

      UPLOAD_LOCATION=/lokales/Upload/Verzeichnis # ohne / am Ende
      DB_PASSWORD=einSicherEsPassw0rd # [a-zA-Z, 0-9] ohne Lücken, keine Sonderzechen

anpassen und das Docker-Image bauen.
  
    => cd $WDIR
    => nano $WDIR/.env
    => docker compose up -d

Login: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):2283
 
 ........Viel Spaß :)
ende


exit 0
