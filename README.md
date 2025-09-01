![upscaled-2x-immich-thumb](https://github.com/user-attachments/assets/66f8ec65-08e8-4d0f-b38e-5fcedcb96a0e)

Blogbeitrag von Jusec https://jusec.me/immich - immich [Quick-Start](https://immich.app/docs/overview/quick-start)


1. Das Repository herunterladen
```
git clone https://github.com/mntma1/immich.mn.git
```

2. Das Installation-Script abfeuern
```
cd immich.mn
./install.sh
```
> [!TIP]
> Es kommen dann folgende Abfragen:

```
=> Wo sollen das docker-compose.yml und das .env hin?: /opt/immich
```
*Das Arbeits-Verzeichnis für Docker(Bei mir liegt das immer unter: /opt/Name.*

```
=> Das Upload-Verzeicnis bitte: /data/immichUpload
```
*Wichtig!! Hier kommt die Media-Library hin, die sollte nicht auf der System-Partition liegen.*

*Da sollte genug Platten-Platz vorhanden sein. z.B.: /data/immichUpload*


```
=> Die Zeit Zone bitte: Europe/Berlin
```
*Für die Schweiz weiß ich die zurzeit nicht* :( 


```
=> Irgendein Datenbank-Passwort bitte: ap8veinai1pi
```
*Generieren mit:* "pwgen -A -n 12". *Oder denkt euch eins aus, aber ohne Lücken und ohne Sonderzeichen* -> [a-zA-Z,0-9]


> [!CAUTION]
> Die Verzeichnisse immer ohne / am Ende angeben
