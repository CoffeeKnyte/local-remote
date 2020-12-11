#!/bin/bash

#target1=$1
#target2=$2

mkdir -p /opt/scripts/backup/plex
mkdir -p /opt/scripts/backup/plex2
docker stop plex
docker stop plex2
sleep 10

#backup db
cp "/opt/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "/opt/scripts/backup/plex/keep.db"
cp "/opt/plex2/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "/opt/scripts/backup/plex2/keep.db"

#backup preferences
cp "/opt/plex/Library/Application Support/Plex Media Server/plexmediaserver.pid" "/opt/scripts/backup/plex/plexmediaserver.pid"
cp "/opt/plex/Library/Application Support/Plex Media Server/Preferences.xml" "/opt/scripts/backup/plex/Preferences.xml"

cp "/opt/plex2/Library/Application Support/Plex Media Server/plexmediaserver.pid" "/opt/scripts/backup/plex2/plexmediaserver.pid"
cp "/opt/plex2/Library/Application Support/Plex Media Server/Preferences.xml" "/opt/scripts/backup/plex2/Preferences.xml"

sleep 5

docker start plex
docker start plex2
