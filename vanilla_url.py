#!/usr/bin/env python3

import sys
from json import load
from urllib.request import urlopen

MANIFEST_URL = 'https://launchermeta.mojang.com/mc/game/version_manifest.json'

manifest = load(urlopen(MANIFEST_URL))

version = manifest['latest']['release'] if sys.argv[1] == 'latest' else sys.argv[1]

for index in manifest['versions']:
	if index['id'] == version:
		meta = load(urlopen(index['url']))
		print(meta['downloads']['server']['url'])
		break
