#!/bin/sh
#SBATCH --job-name=post
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=pascal
#SBATCH --account=b010
#SBATCH -o POST.%j.out

##RUNABLE=/scratch/jlv/run/jars/postCapsuleWithDeltaA.jar
##RUNABLE=/scratch/jlv/run/jars/TwoSoftsAntiSym_20200713.jar
RUNABLE=/home/jlv/Soft/CellInTube/SoftTube_20180520.jar
##RUNABLE=/scratchw/jlv/run/jars/SoftTubeFS_20210201.jar
##RUNABLE=/scratchw/jlv/run/jars/SoftTubeFS_20180409.jar
##RUNABLE=/scratch/jlv/run/jars/SoftTube_PostLongTimeSimu.jar
##RUNABLE=/scratch/jlv/run/jars/SoftRectTube_20190130_2.jar
##RUNABLE=/scratch/jlv/run/RBC/RBC_pince0828.jar
##RUNABLE=/scratch/jlv/run/RBC/RBC_shear0922.jar
##RUNABLE=/scratch/jlv/run/jars/SoftDelRho_20210316.jar

# chargement des modules
#module load intel-mpi/64/2018.0.128

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE -p $WORK_DIR/ $1 $2 $3
