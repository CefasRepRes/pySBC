This forked repository contains updates for use on UEA HPC Ada. 

For original development, please referred to this repository and wiki: 


### How to create ERA5 forcing for NEMO? 

The JMMP repositories provide links to ERA5 forcing for AMM7 and AMM15, e.g. [here](https://gws-access.jasmin.ac.uk/public/jmmp/AMM7/inputs/SBC/). 

To recreate the same forcing files for alternative years, can follow these steps: 
1. Use `get_era5.py` to download the raw ERA5 data. 
    1. NB. This requires use of cdsapi. Refer [here](https://cds.climate.copernicus.eu/api-how-to) for installation instructions.
    1. The years of interest should be set within `config.py`. 
    1. Script extracts global data, so be aware of large file sizes. (Could be modified for future, to skip subset step below?)
    1. Use `sph_on = True` to ensure the files needed to calculate SPH are downloaded. 
    1. To run as a batch job, see `extract_example_era5.sbatch` 

1. Use `gen_era5_legacy.py` to process these files into required format (matching JMMP). 
    1. The years of interest should be set within `gen_era5_legacy.py`.
    1. Within the same script, see logical options to subset (clean) data, or calculating SPH. 
    1. To run as batch job, see `extract_legacy_era5.sbatch`

NB. The two steps above require different conda environments, as shown in the batch scripts. 

*-- Original README content below --*

**31 Jan 24 - RDP**

**This repository had issues with the time coordinates
and the orientation of latitude. A correction has now be applied but not tested.**

# pySBC

Scripts for generating surface boundary conditions for regional NEMO 
configurations.

 - gen_era5.py: Based on a script of Nico's, which processes ERA5 data
   ready for use with NEMO. The reference parameter choices are for AMM15.
 - gen_era5_legacy.py: Nico's original script.

### Setup - conda environment
Use the following to configure a conda environment for use with pySBC.
~~~
conda env create -f environment.yml
~~~
