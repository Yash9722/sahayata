#!/bin/bash
cd /home/ubuntu/sahayata24x7
source venv/bin/activate
nohup gunicorn --bind 0.0.0.0:8000 app:app &