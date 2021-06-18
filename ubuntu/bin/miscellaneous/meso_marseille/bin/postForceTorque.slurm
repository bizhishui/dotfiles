#!/bin/sh
#SBATCH --job-name=postFT
#SBATCH --time=2:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --partition=skylake
#SBATCH --account=b067
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/postForceTorque_20210302.jar

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx12G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/  1
