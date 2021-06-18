#!/bin/sh
#SBATCH --job-name=postSlipper
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o PostSlipper.%j.out

RUNABLE=/scratch/jlv/run/jars/PostSlipper_20181004.jar
##RUNABLE=/scratch/jlv/run/jars/PostSlipperFS_20181008.jar
INPUT=inputFile.txt

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/ $INPUT $1 $2
