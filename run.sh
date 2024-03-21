#!/bin/bash
cd tabbyAPI
ln -f -s ../$2 config.yml
source venv/bin/activate
CUDA_VISIBLE_DEVICES=$1 python main.py
