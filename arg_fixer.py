""" Copies some parts of a JSON string into some files
    for ease of use in a bash script
"""
import json

DATA = json.loads(input())

open("url.txt", "w").write(DATA["url"])
open("key.txt", "w").write(DATA["key"])
open("secret.txt", "w").write(DATA["secret"])
open("server_url.txt", "w").write(DATA["server_url"])
open("path.txt", "w").write(DATA["path"])



