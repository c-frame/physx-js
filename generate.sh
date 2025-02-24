#!/bin/bash

cd ./PhysX/physx
# If we're using the official emscripten/emsdk docker image instead of the deprecated trzeci/emscripten image,
# symlink python3 to python and define the EMSCRIPTEN environment variable used in buildtools/cmake_generate_projects.py
# called by ./generate_projects.sh
if [ ! -f /usr/bin/python ]; then
  ln -s /usr/bin/python3 /usr/bin/python
  export EMSCRIPTEN=/emsdk/upstream/emscripten
fi
./generate_projects.sh emscripten
