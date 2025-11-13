#!/bin/bash
#SBATCH --mail-user=assami.perret@unibe.ch
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name=haplo_BT_chr14
#SBATCH --chdir=/home/student38/course/variantCalling/variants
#SBATCH --time=1:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=1
#SBATCH --partition=pcourseb
#SBATCH --output=haplo_BT_chr14_%j.out
#SBATCH --error=haplo_BT_chr14_%j.err

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

gatk HaplotypeCaller \
  -R ../refIdx/chr14.fa \
  -I ../markduplicates/BT012.dedup.bam \
  -I ../markduplicates/BT134.dedup.bam \
  -O BT_HPC.vcf