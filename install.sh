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
read -p 'Die Zeit Zone bitte: ' TZN
read -p 'Irgendein Datenbank-Passwort bitte: ' DBPASSWD

sudo mkdir $WDIR; sudo chown $USER: $WDIR;
cp -fv example.env docker-compose.yml $WDIR
sudo mkdir $UPLD; sudo chown $USER: $UPLD;
touch $WDIR/.env

clear

cat<<dotenvf >$WDIR/.env
UPLOAD_LOCATION=$UPLD
DB_DATA_LOCATION=$WDIR/postgres
TZ=$TZN
IMMICH_VERSION=releas
DB_DATABASE_NAME=immich
DB_USERNAME=postgres
DB_PASSWORD=$DBPASSWD
dotenvf

cat<<ende
=================================================================================================

Das docker-compose.yml liegt in: $WDIR

Führe nun folgende Befehle ausführen:
  
    => cd $WDIR
    => docker compose up -d

Login: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):2283
 
 ........Viel Spaß :)

=================================================================================================
ende
exit 0
