#!/bin/bash

#
cd /workspace/
# Cause the script to exit on failure.
set -eo pipefail

# Activate the main virtual environment
. /venv/main/bin/activate

# Download models
wget -P "${WORKSPACE}/HoloCine/checkpoints/HoloCine_dit/full" https://huggingface.co/hlwang06/HoloCine/resolve/main/HoloCine_dit/full/full_high_noise.safetensors
wget -P "${WORKSPACE}/HoloCine/checkpoints/HoloCine_dit/full" https://huggingface.co/hlwang06/HoloCine/resolve/main/HoloCine_dit/full/full_low_noise.safetensors

huggingface-cli download Wan-AI/Wan2.2-T2V-A14B --local-dir ${WORKSPACE}/checkpoints/Wan2.2-T2V-A14B --allow-patterns "models_t5_*.pth" "Wan2.1_VAE.pth"
