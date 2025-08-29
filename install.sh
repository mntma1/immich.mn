#!/usr/bin/env bash
# Created by Manfred - 29.08.2025 05:28 Uhr

clear
cat<<anfang
Hier das lokale Arbeits-Verzeichnis eintragen(Ohne / am Ende!). 
Zum Beispiel: /opt/immich oder auch ~/immich
anfang
echo Hier liegen dann die docker-compose Datein-
echo
read -p 'Das Arbeiits-Verzeichnis bitte: ' WDIR
echo
echo Hier werden die Media Dateien abgelegt(Hier sollte genung Speicherplatz zur Verfügung stehen!).
read -p 'Das Upload-Verzeicnis bitte: ' UPLD
read -p 'Die Zeit Zone(für Deuschland: Europe/Berlin) bitte:' TZN

#sudo mkdir $WDIR; sudo chown $USER: $WDIR;
#cp -fv .env example.env docker-compose.yml $WDIR
#sudo mkdir $UPLD; sudo chown $USER: $UPLD;

clear

cat<<ende
=================================================================================================

Das docker-compose File liegt in: $WDIR
Das Media Dateien werden in: $UPLD abgespeichert. 

$EDIR erstellt
$UPLD erstellt
Die Zeit Zone ist: $TZN

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

=================================================================================================
ende


exit 0
