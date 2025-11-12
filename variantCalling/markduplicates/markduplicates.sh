 #!/bin/bash
# Slurm options
# SBATCH --mail-user=<assami.perret@unibe.ch>
# SBATCH --mail-type=fail,end
# SBATCH --job-name="markDuplicates"
# SBATCH --chdir=.
# SBATCH --time=3: 00: 00
# SBATCH --mem=4G
# SBATCH --partition=pcourseb
# SBATCH --output=markDuplicates_%j.out
# SBATCH --error=markDuplicates_%j.err

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load Java/17.0.6

gatk MarkDuplicates INPUT=BT134.sorted.bam OUTPUT=BT134.dedup.bam REMOVE_DUPLICATES=FALSE METRICS_FILE=BT134.marked_dup_metrics.txt