#!/bin/sh

read URL

rm *.webm > /dev/null
rm *.mkv > /dev/null
mc config host add server "$SERVER_URL" "$KEY" "$SECRET" > prod.log &&
youtube-dl -x --audio-format mp3 --exec "mc cp {} server/$MINIO_PATH; echo {}.log > filename.txt" "$URL"$
mc cp prod.log "server/songs.log/$(cat filename.txt)"
rm *.txt > /dev/null
rm *.mp3 > /dev/null
exit 0
