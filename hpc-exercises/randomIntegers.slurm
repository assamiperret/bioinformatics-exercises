#!/bin/bash
#SBATCH -p pcourseb 
#SBATCH -N 1 
#SBATCH -n 1 
#SBATCH --mem 8G 
#SBATCH -t 0-2:00 
#SBATCH -o randomIntegers.out
#SBATCH -e randomIntegers.err


for i in {1..100}; do echo $RANDOM >> randomIntegers.txt; done
sort -n randomIntegers.txt