# Gamocosm Minecraft Flavours
Official setup scripts used by Gamocosm for different flavours of Minecraft servers.
Read this [wiki page][1] for instructions on adding support for new flavours.

## Conventions
- the Minecraft folder is `/home/mcuser/minecraft/`
- script will be run as root inside the Minecraft folder
- do not rename/delete/replace the Minecraft folder
- a `$MINECRAFT_FLAVOUR_VERSION` environment variable will be provided
- be idempotent (as best as possible)
- cleanup any intermediate files and folders
- Gamocosm will recursively `chown` the Minecraft folder (for `mcuser`)

[1]: https://github.com/Gamocosm/Gamocosm/wiki/Installing-different-versions-of-Minecraft
