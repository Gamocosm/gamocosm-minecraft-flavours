# Gamocosm Minecraft Flavours
Official setup scripts used by Gamocosm for different flavours of Minecraft servers.
Read this [wiki page][1] for instructions on adding support for new flavours.

## Conventions
- give credit to the server/modpack developers
- the script should not make any assumptions about where it is run, and install the server in the current directory
- Gamocosm will run the script as root, and recursively `chown` the Minecraft folder (for `mcuser`)
- you can use `pushd <dir>` and `popd` instead of `cd <dir>`
- `chmod u+x` the scripts
- a `$MINECRAFT_FLAVOUR_VERSION` environment variable will be provided
- be idempotent (as best as possible)
	- delete any files that may exist beforehand (e.g. from a failed installation) that could cause conflicts
- don't delete/modify anything else you don't have to
- cleanup any intermediate files and folders
- look at the existing scripts for examples/templates

[1]: https://github.com/Gamocosm/Gamocosm/wiki/Installing-different-versions-of-Minecraft
