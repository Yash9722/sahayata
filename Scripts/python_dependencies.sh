#!/bin/bash

set -e  # Exit on any error
set -x  # Print each command

APP_DIR="/home/ubuntu/sahayata24x7"
VENV_DIR="$APP_DIR/venv"
REQ_FILE="$APP_DIR/requirements.txt"

# Ensure ownership is correct for the ubuntu user
chown -R ubuntu:ubuntu "$APP_DIR"

# Run all commands as the ubuntu user
sudo -u ubuntu bash <<EOF
  # Remove existing virtual environment
  rm -rf "$VENV_DIR"

  # Create a new virtual environment
  python3 -m venv "$VENV_DIR"

  # Activate virtual environment
  source "$VENV_DIR/bin/activate"

  # Check if requirements.txt exists
  if [ ! -f "$REQ_FILE" ]; then
    echo "❌ requirements.txt not found at $REQ_FILE"
    exit 1
  fi

  # Upgrade pip and install dependencies
  pip install --upgrade pip
  pip install -r "$REQ_FILE"
EOF
