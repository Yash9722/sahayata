#!/bin/bash
cp /home/ubuntu/sahayata24x7/gunicorn/gunicorn.service /etc/systemd/system/gunicorn.service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable gunicorn
systemctl start gunicorn