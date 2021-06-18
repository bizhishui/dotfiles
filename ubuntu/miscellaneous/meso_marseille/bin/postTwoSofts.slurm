#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b067
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/TwoSofts_20200208.jar
##RUNABLE=/scratch/jlv/run/jars/TwoSofts_20191127.jar
##RUNABLE=/scratch/jlv/run/jars/TwoSofts_20190924.jar

# chargement des modules
#module load intel-mpi/64/2018.0.128

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE -p $WORK_DIR/ $1 $2 $3
