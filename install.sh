#!/usr/bin/env bash
# Created by Manfred - 28.08.2025 05:28 Uhr

read -p 'Das Arbeiits Verzeichnis bitte: ' WDIR 
#sudo mkdir $UDIR; sudo chown $USER: $UDIR;
#cp .env docker-compose.yml install.sh $WDIR
cat<<ende

Das Das Arbeits Verzeichnis ist: $WDIR

cd $WDIR

In der .env  
  UPLOAD_LOCATION=
  DB_PASSWORD=
anpassen

=> nano .env
=> docker compose up -d

ende


exit 0
