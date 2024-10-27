#!/bin/bash

# Find all .tex files in the current directory
for texfile in *.tex; do
    # Get the base name of the file (without extension)
    basename=$(basename "$texfile" .tex)

    echo "Compiling $texfile with LuaLaTeX..."

    # Compile the .tex file twice
    lualatex "$texfile"
    lualatex "$texfile"

    echo "Finished compiling $texfile"
done