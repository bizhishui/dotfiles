#!/bin/sh
#SBATCH --job-name=postNS
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/postStressTensor_20191204.jar
##RUNABLE=/scratch/jlv/run/jars/SoftPostNormStress_20181001.jar

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/ 2.0
