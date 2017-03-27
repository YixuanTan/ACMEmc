#!/bin/bash
#
# srun command for CSCI-6360 group project.
# USAGE: /full/path/to/./q_MC.out [--help]
#                                 [--init dimension [outfile]]
#                                 [--nonstop dimension outfile steps [increment]]
#                                 [infile [outfile] steps [increment]]
#
#SBATCH --mail-type=END
#SBATCH --mail-user=tany3@rpi.edu
#SBATCH -D /gpfs/u/home/ACME/ACMEtany/scratch/MSMSEpaper/3DweldNewAlgo/15
#SBATCH --partition small
#SBATCH -t 1400
#SBATCH -N 64
#SBATCH -n 4096
#SBATCH --overcommit
#SBATCH -o /gpfs/u/home/ACME/ACMEtany/scratch/MSMSEpaper/3DweldNewAlgo/15/log.log

srun --runjob-opts="--mapping TEDCBA" /gpfs/u/home/ACME/ACMEtany/barn/MSMSEpaper/3Dweld/q_MC.out --nonstop 3 voronmc.00000.dat 15000 100 0 4 673 673 /gpfs/u/home/ACME/ACMEtany/scratch/MSMSEpaper/3DfitMc/16/voronmc.39.dat 
