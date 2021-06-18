#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/solidTranslation_20190529.jar
# chargement des modules
#module load intel-mpi/64/2018.0.128

##new five parameters, 1. file in, 2. file out (without extention), 3. ddx, 4. ddy, 5. ddz

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/ $1 $2 $3 $4 $5
