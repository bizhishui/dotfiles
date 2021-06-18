#!/bin/sh
#SBATCH --job-name=postVel
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=pascal
#SBATCH --account=b010
#SBATCH -o POST.%j.out

##RUNABLE=/scratch/jlv/run/jars/postVelocities_20190417.jar   ##use directly the stored velocity
##RUNABLE=/scratch/jlv/run/jars/postVelocities_20190417_2.jar  ##recompute the total velocity
##RUNABLE=/scratch/jlv/run/jars/postVelocities_20190417_3.jar  ##with another small step
RUNABLE=/scratch/jlv/run/jars/postVelocitiesFD_20190502.jar  ##with another small step
##RUNABLE=/scratch/jlv/run/jars/postVelocities_new_20190417.jar  ##with another small step

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/ $SLURM_NTASKS
