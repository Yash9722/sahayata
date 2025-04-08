#!/bin/bash
set -e

APP_DIR="/home/ubuntu/sahayata24x7"
cd "$APP_DIR"

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Upgrade pip and install requirements
pip install --upgrade pip

if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
else
  echo "ERROR: requirements.txt not found in $APP_DIR"
  exit 1
fi
