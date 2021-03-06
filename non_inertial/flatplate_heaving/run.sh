#!/bin/bash
cd ${0%/*} || exit 1    # run from this directory

# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

runApplication extrudeMesh
runApplication createPatch -overwrite
transformPoints -translate '(0 0 -0.2)'
cd 0.org/include/data/
./run.sh
cd ../../../
cp -r 0.org 0
runApplication decomposePar
runParallel `getApplication` 6
runApplication reconstructPar
rm -r processor*
