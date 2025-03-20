#!/usr/bin/python3

import sys, os, urllib.parse as url

baseURL = "https://musicstax.com/"

song_name = " ".join(sys.argv[1:])
song_name = url.quote_plus(song_name)
print(song_name)

os.system(f"xdg-open {baseURL}/search?q={song_name}")
