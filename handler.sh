#!/bin/sh

if python3 /arg_fixer.py; then
        echo "OK"
else
        echo "ERROR"
        exit 1
fi
        URL=$(cat "url.txt")
        SERVER_URL=$(cat "server_url.txt")
        KEY=$(cat "key.txt")
        SECRET=$(cat "secret.txt")
        FILE_PATH=$(cat "path.txt")

        echo "FILE_PATH: $FILE_PATH" &&
        mc config host add server "$SERVER_URL" "$KEY" "$SECRET" &&
        youtube-dl --exec "mc cp {} server/$FILE_PATH" "$URL"&&
        rm *.txt
        rm *.mp3
        exit 0


