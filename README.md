# Gamocosm Minecraft Favours
Official setup scripts used by Gamocosm for different flavours of Minecraft servers.
After creating a script here, add a corresponding entry to Gamocosm.

## Conventions
- the Minecraft folder is `/home/mcuser/minecraft/`
- script will be run as root inside the Minecraft folder
- do not rename/delete/replace the Minecraft folder
- a `$MINECRAFT_FLAVOUR_VERSION` environment variable will be provided
- be idempotent (as best as possible)
- cleanup any intermediate files and folders
- Gamocosm will recursively `chown` the Minecraft folder (for `mcuser`)
