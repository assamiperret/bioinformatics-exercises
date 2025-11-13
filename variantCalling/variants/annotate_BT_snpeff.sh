#!/bin/bash
# Slurm options
#SBATCH --mail-user=assami.perret@unibe.ch
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name="Effdb_BT"
#SBATCH --chdir=/home/student38/course/variantCalling/variants
#SBATCH --time=1:00:00
#SBATCH --mem=2G
#SBATCH --partition=pcourseb
#SBATCH --output=annVar_%j.out
#SBATCH --error=annVar_%j.err

# Raccourci pour appeler snpEff via Apptainer
snpEff="apptainer exec -B $TMPDIR:/tmp /mnt/containers/apptainer/snpeff:5.2--hdfd78af_1 snpEff"

# Dossier où snpEff stockera ses bases de données
DATA_DIR=/home/student38/course/variantCalling/variants/snpeff_data

mkdir -p "$DATA_DIR"

# 1) Télécharger la base pour le chien (CanFam3.1.99)
$snpEff download \
    -dataDir "$DATA_DIR" \
    -v CanFam3.1.99

# 2) Annoter tes variants filtrés fusionnés
$snpEff eff \
    -dataDir "$DATA_DIR" \
    CanFam3.1.99 \
    BT_HPC.flt.var.vcf > BT_HPC.ann.vcf