#!/bin/bash

set -e  # Exit on error
set -x  # Print each command

APP_DIR="/home/ubuntu/sahayata24x7"
VENV_DIR="$APP_DIR/venv"

# Fix ownership so ubuntu can work here
chown -R ubuntu:ubuntu "$APP_DIR"

# Remove any existing virtual environment
sudo -u ubuntu rm -rf "$VENV_DIR"

# Create a new virtual environment as ubuntu user
sudo -u ubuntu python3 -m venv "$VENV_DIR"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Check for requirements.txt in correct path
REQ_FILE="$APP_DIR/requirements.txt"
if [ ! -f "$REQ_FILE" ]; then
  echo "❌ requirements.txt not found at $REQ_FILE"
  exit 1
fi

# Install Python dependencies
pip install --upgrade pip
pip install -r "$REQ_FILE"
