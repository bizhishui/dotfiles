#!/bin/bash

source_host="chen@duke.l3m.univ-mrs.fr"
source_dir="/home/chen/jinming/CellInTube/workspace/vesicle/Misbah2014_3/"
target_dir="./"
last_backup=$(ssh ${source_host} "ls -t ${source_dir} | grep '.ser' | head -1")
if [ "${last_backup}" == "" ]; then
       echo "ERROR: didn't find a backup, cannot continue!"
else
       echo "the last backup is: ${last_backup}"
             rsync -rav ${source_host}:${source_dir}/${last_backup} ${target_dir}
fi
