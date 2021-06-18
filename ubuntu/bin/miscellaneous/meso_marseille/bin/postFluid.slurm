#!/bin/sh
#SBATCH --job-name=postFluid
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=MaxMemPerCPU
#SBATCH --partition=kepler
#SBATCH --account=b010
#SBATCH -o POST.%j.out

#RUNABLE=/scratch/jlv/run/jars/postFluid_20190123_2.jar
RUNABLE=/scratch/jlv/run/jars/postFluid_20190424_noP.jar

## $1 - inputFile, $2 - Ux, $3 - Uy, $4 - Uz

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -XX:-UseGCOverheadLimit -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $1 $2 $3 $4
