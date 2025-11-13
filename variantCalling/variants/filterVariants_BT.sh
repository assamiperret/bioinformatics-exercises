#!/bin/bash
# Slurm options
#SBATCH --mail-user=assami.perret@unibe.ch
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name="filterBT"
#SBATCH --chdir=/home/student38/course/variantCalling/variants
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --partition=pcourseb
#SBATCH --output=fltVar_%j.out
#SBATCH --error=fltVar_%j.err

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

# Filtrage des SNPs
gatk VariantFiltration \
  -V BT_HPC.snps.vcf \
  -O BT_HPC.flt.snps.vcf \
  -filter "QD < 2.0" --filter-name "QD2" \
  -filter "QUAL < 30.0" --filter-name "QUAL30" \
  -filter "SOR > 3.0" --filter-name "SOR3" \
  -filter "FS > 60.0" --filter-name "FS60" \
  -filter "MQ < 40.0" --filter-name "MQ40" \
  -filter "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" \
  -filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8"

# Filtrage des INDELs
gatk VariantFiltration \
  -V BT_HPC.indels.vcf \
  -O BT_HPC.flt.indels.vcf \
  -filter "QD < 2.0" --filter-name "QD2" \
  -filter "QUAL < 30.0" --filter-name "QUAL30" \
  -filter "FS > 200.0" --filter-name "FS200" \
  -filter "ReadPosRankSum < -20.0" --filter-name "ReadPosRankSum-20"