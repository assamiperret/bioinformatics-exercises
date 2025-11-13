#!/bin/bash
# Slurm options
#SBATCH --mail-user=assami.perret@unibe.ch
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name="mergeBT"
#SBATCH --chdir=/home/student38/course/variantCalling/variants
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --partition=pcourseb
#SBATCH --output=mergeVar_%j.out
#SBATCH --error=mergeVar_%j.err

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

gatk MergeVcfs \
  -I BT_HPC.flt.snps.vcf \
  -I BT_HPC.flt.indels.vcf \
  -O BT_HPC.flt.var.vcf