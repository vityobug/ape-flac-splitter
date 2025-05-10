#!/bin/bash

set -e

# Check if required packages are installed
required_packages=("cuetools" "shntool" "flac" "ffmpeg")

for pkg in "${required_packages[@]}"; do
    if ! dpkg -l | grep -q "$pkg"; then
        echo "$pkg is not installed. Installing..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed."
    fi
done

# Ask to select a .cue file
echo "Select a .cue file:"
select cue_file in *.cue; do
    [[ -n "$cue_file" ]] && break
    echo "Invalid selection."
done

# Derive base name (strip .cue extension)
base_name="${cue_file%.cue}"

# Check for matching audio file (FLAC or APE)
if [[ -f "$base_name.flac" ]]; then
    audio_file="$base_name.flac"
elif [[ -f "$base_name.ape" ]]; then
    echo "Converting $base_name.ape to FLAC..."
    ffmpeg -i "$base_name.ape" "$base_name.flac"
    audio_file="$base_name.flac"
else
    echo "No matching .flac or .ape file found for $cue_file"
    exit 1
fi

# Create output directory
mkdir -p tracks

# Split using shnsplit and the cue file
echo "Splitting tracks..."
shnsplit -f "$cue_file" -o flac -t "%n - %t" -d tracks "$audio_file"

echo "Done. Tracks are in the 'tracks/' directory."

