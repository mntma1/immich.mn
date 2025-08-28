#!/usr/bin/env bash
# Created by Manfred - 28.08.2025 05:28 Uhr
clear
read -p 'Das Arbeiits Verzeichnis bitte: ' WDIR 
#sudo mkdir $UDIR; sudo chown $USER: $UDIR;
#cp -fv .env docker-compose.yml install.sh $WDIR
clear

cat<<ende
  Das Arbeits Verzeichnis ist: $WDIR

   In der Datei: $WDIR/.env

      UPLOAD_LOCATION=

      und

      DB_PASSWORD=

  anpassen und das Docker-Image bauen.
    
    => cd $WDIR

    => nano $WDIR/.env

    => docker compose up -d

 ........Viel Spaß :)

ende


exit 0
