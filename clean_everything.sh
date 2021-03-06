#!/bin/bash
set -eu

# Remove everything automatically created.
# With the exception of auto-created stuff that is precious/difficult
# to recreate (requires some unusual software) and so is part of the repository.
#
# Runs also dircleaner (get it from castle_game_engine/examples/tools/dircleaner.lpr)
# to remove a lot of trash, including editor backups (*~). Compile
# and move dircleaner somewhere to your $PATH before running this,
# otherwise this script will fail at the end.
#
# Requires environment variable $CASTLE_ENGINE_PATH to be set
# to a directory containing castle_game_engine and other projects
# (required by this script itself, and also some of it's child scripts).

echo "Castle Game Engine path detected: ${CASTLE_ENGINE_PATH}"
cd "${CASTLE_ENGINE_PATH}"
if [ '!' -d castle_game_engine ]; then cd ..; fi

# programs
make clean -C castle/
make cleanmore -C castle_game_engine/
make clean -C glinformation/
make clean -C glplotter/
make clean -C glviewimage/
make clean -C kambi_lines/
make clean -C malfunction/
make clean -C rayhunter/
make clean -C view3dscene/
make clean -C darkest_before_dawn/
make clean -C little_things/
make clean -C mountains_of_fire/
make clean -C hotel_nuclear/

# models
make clean -C demo_models/shadow_maps/castle_with_trees/

dircleaner . clean
