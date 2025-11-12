#!/bin/bash
# Slurm options

#SBATCH --mail-type=fail,end
#SBATCH --job-name="idxRef"
#SBATCH --chdir=.
#SBATCH --time=1:00:00
#SBATCH --mem=5G
#SBATCH --cpus-per-task=1
#SBATCH -p pcourseb
#SBATCH --output=idxRef_%j.out
#SBATCH --error=idxRef_%j.err

module add BWA/0.7.17-GCC-10.3.0
module load SAMtools/1.13-GCC-10.3.0
module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

bwa index -a bwtsw -p chr14.fa chr14.fa
samtools faidx chr14.fa
gatk CreateSequenceDictionary R=chr14.fa O=chr14.dict