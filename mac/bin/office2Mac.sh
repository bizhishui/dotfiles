#!/bin/bash

rsync -rav -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' --exclude='RUN*' jinming@195.83.116.110:/data/workspace/Stokes/CellInTube/vesicle/Misbah2014_3/* /Users/Jinming/workspaces/Stokes/SoftInTube/vesicle/Misbah2014_3/
