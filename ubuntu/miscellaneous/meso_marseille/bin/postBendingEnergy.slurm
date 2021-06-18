#!/bin/sh
#SBATCH --job-name=postEb
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=MaxMemPerCPU
#SBATCH --partition=kepler
#SBATCH --account=b010
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/PostBendingEnergy_20200219.jar

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -XX:-UseGCOverheadLimit -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/
