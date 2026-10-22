#!/bin/bash
set -e

echo "Starting Discord VPS Bot inside the container..."
exec /opt/venv/bin/python3 bot.py
