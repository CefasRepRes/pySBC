#!/bin/bash
#SBATCH -p cefas-ib-24-96
#SBATCH --qos=cefas-ib
#SBATCH -o %j-def.out
#SBATCH -e %j-def.err
#SBATCH -t 2-00:00:00
#SBATCH --job-name=getera5
#SBATCH --ntasks=4

module purge
module add mamba/4.10.3.5
eval "$(conda shell.bash hook)"
conda activate pysbc

module add nco/4.9.3

export PYTHONPATH="$HOME/python/bin":"$HOME/python/cdsapi-0.1.1/cdsapi"

echo "Extracting ERA5..."
python get_era5.py 

#echo "Processing ERA5..."
#python gen_era5.py

