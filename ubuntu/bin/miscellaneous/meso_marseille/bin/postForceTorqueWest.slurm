#!/bin/sh
#SBATCH --job-name=postFT
#SBATCH --time=2:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --partition=westmere
#SBATCH --account=westmere
#SBATCH -o POST.%j.out

RUNABLE=/scratchw/jlv/run/jars/postForceTorque_20210302.jar

WORK_DIR=$PWD
java -Xss512m -Xms1G -Xmx12G -Djava.library.path="/scratchw/jlv/run/soft_lib/" -jar $RUNABLE $WORK_DIR/  1
