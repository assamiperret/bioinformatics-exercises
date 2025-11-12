#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --output=qual.out
#SBATCH --error=qual.err
#SBATCH --job-name=fastp
#SBATCH --cpus-per-task=4
#SBATCH --partition=pcourseb

module add fastp/0.23.4-GCC-10.3.0

fastp -w 4 -q 15 -z 5 -l 50 -i ~/course/dataPreProcess/raw_data/SRR1027171_1.fastq.gz -I ~/course/dataPreProcess/raw_data/SRR1027171_2.fastq.gz -o ~/course/dataPreProcess/clean_fastq_data/SRR1027171_1.clean.fq.gz -O ~/course/dataPreProcess/clean_fastq_data/SRR1027171_2.clean.fq.gz