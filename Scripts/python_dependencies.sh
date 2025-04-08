#!/bin/bash

set -e  # Exit on any error

APP_DIR="/home/ubuntu/sahayata24x7"
VENV_DIR="$APP_DIR/venv"

# Ensure the app directory exists
if [ ! -d "$APP_DIR" ]; then
    echo "Application directory $APP_DIR does not exist. Exiting."
    exit 1
fi

# Ensure correct ownership
sudo chown -R ubuntu:ubuntu "$APP_DIR"

cd "$APP_DIR"

# Remove old venv if it exists to avoid permission conflicts
if [ -d "$VENV_DIR" ]; then
    rm -rf "$VENV_DIR"
fi

# Create virtual environment
python3 -m venv venv

# Activate it
source "$VENV_DIR/bin/activate"

# Check if requirements.txt exists
if [ ! -f "$APP_DIR/requirements.txt" ]; then
    echo "requirements.txt not found in $APP_DIR"
    deactivate
    exit 1
fi

# Upgrade pip and install dependencies
pip install --upgrade pip
pip install -r "$APP_DIR/requirements.txt"

echo "Python dependencies installed successfully."
