#!/bin/bash
set -e

DEPLOY_DIR="/home/ubuntu/sahayata24x7"
REQUIREMENTS_PATH="$DEPLOY_DIR/sahayata24x7/requirements.txt"
VENV_PATH="$DEPLOY_DIR/venv"

# Create virtual environment if not exists
if [ ! -d "$VENV_PATH" ]; then
  python3 -m venv "$VENV_PATH"
fi

# Activate the venv
source "$VENV_PATH/bin/activate"

# Install dependencies
pip install --upgrade pip
pip install -r "$REQUIREMENTS_PATH"
