#!/usr/bin/env bash

# Install Nextflow
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mv nextflow /bin

# Install tcrconverter
git clone https://github.com/emjbishop/tcr-converter.git
pip install tcr-converter/