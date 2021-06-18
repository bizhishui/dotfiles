#!/bin/sh
#SBATCH --job-name=postRefine
#SBATCH --time=00:04:00
#SBATCH --ntasks-per-node=1
##SBATCH --mem-per-cpu=MaxMemPerCPU
#SBATCH --partition=skylake
#SBATCH --account=b010
#SBATCH -o RUN.%j.out
#SBATCH -e RUN.%j.err

## postRefine.slurm 015.9400000.ser 2 Ca10nu0d95Beta0d25_shapeRefined

##RUNABLE=/scratch/jlv/run/jars/RefineVesicle_20200131.jar
RUNABLE=/scratch/jlv/run/jars/RefineVesicle_20190121.jar
##RUNABLE=/scratch/jlv/run/jars/RefineShape.jar
LOGFILE=RUN.$SLURM_JOB_ID.err

echo "Running on: $SLURM_NODELIST"
cat $0 >> $LOGFILE
# $1 - file ser in, $2 - nb of refinement, $3 - file out without extenstion
java -Xss512m -Xms1G -Xmx12G -Djava.library.path="/scratch/jlv/run/soft_lib/" -jar $RUNABLE $1 $2 $3
