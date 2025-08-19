#!/bin/bash
set -e

# Update and install dependencies
sudo apt-get update -y
sudo apt-get install -y python3-pip git

# Install Python packages
pip3 install flask gunicorn

# Clone repo
cd /home
if [ ! -d "gcp-compute-enginee-project" ]; then
    git clone https://github.com/Akansha9821/gcp-compute-enginee-project.git
fi
cd gcp-compute-enginee-project

# Run app with Gunicorn (serves Flask app at port 8080)
gunicorn -b 0.0.0.0:8080 app:app --daemon
