#!/bin/bash
# Slurm options
#SBATCH --mail-user=assami.perret@unibe.ch
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name="selectVariants_BT"
#SBATCH --chdir=/home/student38/course/variantCalling/variants
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --partition=pcourseb
#SBATCH --output=selectVar_%j.out
#SBATCH --error=selectVar_%j.err

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

# Select INDELs
gatk SelectVariants \
  -V BT_HPC.vcf \
  --select-type-to-include INDEL \
  -O BT_HPC.indels.vcf

# Select SNPs
gatk SelectVariants \
  -V BT_HPC.vcf \
  --select-type-to-include SNP \
  -O BT_HPC.snps.vcf