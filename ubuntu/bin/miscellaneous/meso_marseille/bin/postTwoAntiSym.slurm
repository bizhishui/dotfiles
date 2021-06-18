#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=100:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o POST.%j.out

##RUNABLE=/scratch/jlv/run/jars/TwoSoftsAntiSym_20200713.jar
##RUNABLE=/scratch/jlv/run/jars/TwoSoftsAntiSym_20200402.jar
##RUNABLE=/scratch/jlv/run/jars/TwoSoftsAntiSym_20200225.jar
##RUNABLE=/scratch/jlv/run/jars/postTwoAntiLongTimeSimu_20191216.jar
RUNABLE=/scratch/jlv/run/jars/TwoSoftsAntiSym_20190905.jar

# chargement des modules
#module load intel-mpi/64/2018.0.128

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE -p $WORK_DIR/ $1 $2 $3
