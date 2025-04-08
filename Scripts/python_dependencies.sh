#!/bin/bash

cd /home/ubuntu/sahayata24x7

# Ensure ownership of the directory (fix permission error)
sudo chown -R ubuntu:ubuntu /home/ubuntu/sahayata24x7

# Create virtual environment as ubuntu user
python3 -m venv venv

# Activate it
source venv/bin/activate

# Upgrade pip and install requirements
pip install --upgrade pip
pip install -r /home/ubuntu/sahayata24x7/requirements.txt
