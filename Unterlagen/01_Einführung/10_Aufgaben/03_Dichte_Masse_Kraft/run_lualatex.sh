#!/bin/bash

# Find all .tex files in the current directory
for texfile in *.tex; do
    # Get the base name of the file (without extension)
    basename=$(basename "$texfile" .tex)

    # Backup the original file
    cp "$texfile" "${texfile}.bak"

    # Compile with solutions (SOL version)
    # Uncomment or add \printanswers before \begin{document}
    sed -i '' 's/%\\printanswers/\\printanswers/' "$texfile"
    if ! grep -q '\\printanswers' "$texfile"; then
        sed -i '' '/\\begin{document}/i \\\printanswers' "$texfile"
    fi

    lualatex -jobname="${basename}_Sol" "$texfile"
    lualatex -jobname="${basename}_Sol" "$texfile"
    lualatex -jobname="${basename}_Sol" "$texfile"

    # Restore the original file for the non-solution version
    mv "${texfile}.bak" "$texfile"

    # Compile without solutions (NOSOL version)
    lualatex -jobname="${basename}_Stud" "$texfile"
    lualatex -jobname="${basename}_Stud" "$texfile"
    lualatex -jobname="${basename}_Stud" "$texfile"
done