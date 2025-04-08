#!/bin/bash

set -e  # Stop on any error
set -x  # Print each command

APP_DIR="/home/ubuntu/sahayata24x7"
VENV_DIR="$APP_DIR/venv"

# Fix ownership
sudo chown -R ubuntu:ubuntu "$APP_DIR"

# Remove old venv (helps fix permission issues)
rm -rf "$VENV_DIR"

# Create new venv
python3 -m venv "$VENV_DIR"

# Activate venv
source "$VENV_DIR/bin/activate"

# Check for requirements.txt
if [ ! -f "$APP_DIR/requirements.txt" ]; then
  echo "❌ requirements.txt not found in $APP_DIR"
  exit 1
fi

# Install dependencies
pip install --upgrade pip
pip install -r "$APP_DIR/requirements.txt"
