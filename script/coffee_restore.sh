#!/bin/bash

target=$1

#restore db
cp "/opt/scripts/backup/$1/keep.db" "/opt/$1/Library/Application Support/Plex Media Server/Plug-in Support/Databases/keep.db"
cp "/opt/scripts/backup/$1/plexmediaserver.pid" "/opt/$1/Library/Application Support/Plex Media Server/plexmediaserver.pid"
cp "/opt/scripts/backup/$1/Preferences.xml" "/opt/$1/Library/Application Support/Plex Media Server/Preferences.xml"

cd "/opt/$1/Library/Application Support/Plex Media Server/Plug-in Support/Databases"
$SHELL
