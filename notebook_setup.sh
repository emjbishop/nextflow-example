#!/usr/bin/env bash

# Install Nextflow
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mv nextflow /bin

# Install tcrconvert
git clone https://github.com/seshadrilab/tcrconvert.git
pip install tcrconvert/