#!/bin/bash


WATCH_PATH="/mnt/data"


LOG_FILE="/mnt/data/path/logfile.log"

# run the inotifywait command to monitor for create and delete event 
inotifywait -m -e create -e delete "$WATCH_PATH" | while read -r path event file;do
	echo "$(date +"%Y-%m-%d %H:%M:%S") - $event - $file " >> "$LOG_FILE"
done
