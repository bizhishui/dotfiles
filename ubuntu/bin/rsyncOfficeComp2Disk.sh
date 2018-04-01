#!/bin/bash

# current path of this file /data
#--delete used to clear extra files or dirs
rsync -urav --delete /home/jinming/bin /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/bizhishui.github.io /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/Desktop /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/Documents /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/Music /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/Pictures /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/simuCodes /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete /home/jinming/Videos /media/jinming/SHARE/bkupOfficeComp/
rsync -urav --delete --exclude='*.ser' --exclude='*.vtk' --exclude='*.o' --exclude='RUN*' /home/jinming/workspace /media/jinming/SHARE/bkupOfficeComp/
