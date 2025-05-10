# Split Album Script

## Description

This script automates the process of splitting audio albums using a `.cue` file. It works with either `.flac` or `.ape` files and does the following:

1. **Installs dependencies** if they are not already installed. These include `cuetools`, `shntool`, `flac`, and `ffmpeg`.
2. **Prompts the user** to select a `.cue` file in the current directory.
3. **Finds the matching audio file**:
   - If a `.flac` file with the same name as the `.cue` file exists, it uses that file.
   - If only an `.ape` file with the same name exists, it converts it to `.flac` using `ffmpeg`.
4. **Splits the album** into individual tracks based on the `.cue` file and saves them as `.flac` files in a directory named `tracks/`.
5. **Handles multiple formats** without requiring user intervention.

This script is tailored for **Ubuntu**-based systems, and some adjustments might be needed to run it on other Linux distributions (e.g., different package managers like `dnf` for Fedora, or `pacman` for Arch Linux).

## Purpose

The script is designed to help automate the process of splitting album files (often from formats like `.ape`) into individual tracks using a `.cue` file. It is particularly useful when dealing with audio collections where albums are stored in a single large file and need to be split into individual tracks based on metadata provided in a `.cue` file.

## Prerequisites

- Linux (Ubuntu/Debian-based systems)
- The following packages are required:
  - `cuetools`
  - `shntool`
  - `flac`
  - `ffmpeg`

The script will automatically install these dependencies if they are not already installed.

## Installation

1. **Download the script** and make it executable. The script must be downloaded into the **same directory** as the `.cue` and `.flac` (or `.ape`) files.

   ```bash
   chmod +x split-album.sh

2. Run the script:

   ```bash
   ./split-album.sh
   ```

3. Follow the prompts to select the .cue file to split the album.

## Usage

1. Place the .cue file and its associated .flac or .ape file(s) in the same directory as the script.

2. Run the script.

3. The script will:

   - Ask you to select a `.cue` file.

   - Find the matching `.flac` or `.ape` file.

   - If needed, convert the `.ape` file to `.flac`.

   - Split the album into tracks based on the `.cue` file and place them into a new directory called `tracks/`.

For example, if you have the following files in the same directory:

- `foo - bar.cue`

- `foo - bar.flac` or `foo - bar.ape`

Running the script will split the album into individual tracks and 
place them in the `tracks/` directory, named according to the track number 
and title (e.g., `01 - Track Title.flac`, `02 - Track Title.flac`, etc.).

## Notes

- The script assumes that the `.flac` or `.ape` file shares the same base name as the `.cue` file (i.e., `foo - bar.cue` and `foo - bar.flac` or `foo - bar.ape`).

- The `tracks/` directory will be created if it doesn't exist, and the individual tracks will be saved there.

- The script checks if the required packages (`cuetools`, `shntool`, `flac`, and `ffmpeg`) are installed before attempting to install them.

- Use your own utilities to add metadata to the tracks.
