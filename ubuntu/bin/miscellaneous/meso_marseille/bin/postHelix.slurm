#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=pascal
#SBATCH --account=b010
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/PostVesicleHelix_20200901.jar

# chargement des modules
#module load intel-mpi/64/2018.0.128

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $1 $2 $3 $4 $5 $6 $7 $8
