#!/usr/bin/env bash
# Created by Manfred - 29.08.2025 05:28 Uhr

clear
echo Hier liegt dann die docker-compose.yml Datei.
read -p 'Wo soll das docker-compose.yml hin?: ' WDIR
echo ""
echo Hier werden die Media-Dateien abgelegt.
echo Dort sollte sollte genung Speicherplatz zur Verfügung stehen.
read -p 'Das Upload-Verzeicnis bitte: ' UPLD
echo ""
echo Für Deuschland "Europe/Berlin" 
read -p 'Die Zeit Zone bitte:' TZN
read -p 'Irgendein Datenbank-Passwort bitte: ' DBPASSWD

#sudo mkdir $WDIR; sudo chown $USER: $WDIR;
#cp -fv .env example.env docker-compose.yml $WDIR
#sudo mkdir $UPLD; sudo chown $USER: $UPLD;

clear

cat<<ende
=================================================================================================

Das docker-compose File liegt in: $WDIR
Das Media Dateien sind dann in: $UPLD 

Docher Files in: $WDIR
Uploads iN: $UPLD
Die Zeit Zone ist: $TZN
Das DB-Passwortlautet: $DBPASSWD

!!Das Passwort brauchst du dir nicht zu merken, eendient nur zur sichern Verbindung zur DB

Nun folgende Befehle ausführen:
  
    => cd $WDIR
    => nano $WDIR/.env
    => docker compose up -d

Login: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):2283
 
 ........Viel Spaß :)

=================================================================================================
ende


exit 0
