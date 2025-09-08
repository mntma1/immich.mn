#!/usr/bin/env bash
# Created by Manfred - 29.08.2025 05:28 Uhr

clear
echo Hier liegt dann die docker-compose.yml Datei. Bei mir ligt das immer unter: /opt/immich-app
read -p 'Wo soll das docker-compose.yml und das .env hin?: ' WDIR
echo ""
echo Hier werden die Media-Dateien abgelegt.
echo Dort sollte sollte genung Speicherplatz zur Verfügung stehen.
echo z.B.: /home/immichUpload
read -p 'Das Upload-Verzeicnis bitte: ' UPLD
echo ""
echo Für Deuschland "Europe/Berlin" 
read -p 'Die Zeit Zone bitte: ' TZN
echo ""
echo Nur [A-Za-z,0-9], Ohne Lücken oder Sonderzeichen
echo Das lässt sich gut mit: pwgen -A -n 16 erzeugen.
read -p 'Irgendein Datenbank-Passwort bitte: ' DBPASSWD
# Oder mit nun mit: => DB_PASSWORD=$(pwgen -A -n 12) <= erzeugen 
# Dazu mus aber pwgen installiert sein. => sudo  apt install pwgen

sudo mkdir -p $WDIR; sudo chown $USER: $WDIR;
sudo mkdir -p $UPLD; sudo chown $USER: $UPLD;
cp -f example.env docker-compose.yml $WDIR

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

Das docker-compose.yml und die .env liegen in: $WDIR
Die Media-Dateien lieen in: $UPLD

Führe nun folgende Befehle aus:
  
    => cd $WDIR
    => docker compose up -d

Login: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):2283

........Viel Spaß :)

=================================================================================================
ende
exit 0
