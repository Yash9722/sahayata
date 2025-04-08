#!/bin/bash

cd /home/ubuntu/sahayata24x7

# Create virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r /home/ubuntu/sahayata24x7/requirements.txt
