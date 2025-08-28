#!/usr/bin/env bash
# Created by Manfred - 28.08.2025 05:28 Uhr

read -p 'Das Upload Verzeichnis bitte: ' UPLV 
#sudo mkdir $UDIR; sudo chown $USER: $UDIR;

cat<<ende

Das Upload Verzeichnis ist: $UPLV

ende


exit 0
