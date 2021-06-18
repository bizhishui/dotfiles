#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/SoifTube3_20201101.jar
##RUNABLE=/scratch/jlv/run/jars/SoifTube_20201008.jar
##RUNABLE=/scratch/jlv/run/jars/DropTube_20200413.jar
##RUNABLE=/scratch/jlv/run/jars/testReferenceFlow_20191014.jar

# chargement des modules
#module load intel-mpi/64/2018.0.128

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE -p $WORK_DIR/ $1 $2 $3
