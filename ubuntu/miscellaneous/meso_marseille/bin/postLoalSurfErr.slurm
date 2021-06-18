#!/bin/sh
#SBATCH --job-name=postLSE
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=skylake
#SBATCH --account=b067
#SBATCH -o POST.%j.out

RUNABLE=/scratch/jlv/run/jars/PostLocalSurfErr_20181025.jar

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx16G -Djava.library.path="/home/jlv/soft/SOFT_Libs/soft_lib/" -jar $RUNABLE $WORK_DIR/ $SLURM_NTASKS
