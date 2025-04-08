#!/bin/bash
set -e

cd /home/ubuntu/sahayata24x7

# Only create venv if it doesn't already exist
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
