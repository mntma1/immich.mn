#!/usr/bin/env bash
# Created by Manfred - 29.08.2025 05:28 Uhr

clear
echo Hier liegt dann die docker-compose.yml Datei.
read -p 'Wo soll das docker-compose.yml hin?: ' WDIR
echo ""
echo Hier werden die Media-Dateien abgelegt.
echo Dort sollte sollte genung Speicherplatz zur Verfügung stehen.
echo z.B.: /home/immichUpload
read -p 'Das Upload-Verzeicnis bitte: ' UPLD
echo ""
echo Für Deuschland "Europe/Berlin" 
read -p 'Die Zeit Zone bitte: ' TZN
read -p 'Irgendein Datenbank-Passwort bitte: ' DBPASSWD

sudo mkdir -pv $WDIR; sudo chown -v $USER: $WDIR;
cp -fv example.env docker-compose.yml $WDIR
sudo mkdir -pv $UPLD; sudo chown -v $USER: $UPLD;

PGDIR=$WDIR/postgres
cat<<dotenvf >$WDIR/.env
# You can find documentation for all the supported env variables at https://immich.app/docs/install/environment-variables
 
# The location where your uploaded files are stored
UPLOAD_LOCATION=$UPLD
 
# The location where your database files are stored. Network shares are not supported for the database
DB_DATA_LOCATION=$PGDIR
 
# To set a timezone, uncomment the next line and change Etc/UTC to a TZ identifier from this list: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
TZ=$TZN
 
# The Immich version to use. You can pin this to a specific version like "v1.71.0"
IMMICH_VERSION=release
 
# Connection secret for postgres. You should change it to a random password
# Please use only the characters `A-Za-z0-9`, without special characters or spaces
DB_PASSWORD=$DBPASSWD
 
# The values below this line do not need to be changed
###################################################################################
DB_USERNAME=postgres
DB_DATABASE_NAME=immich
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
