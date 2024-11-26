#!/bin/bash

# Find all .tex files in the current directory
for texfile in *.tex; do
    # Get the base name of the file (without extension)
    basename=$(basename "$texfile" .tex)

    # Backup the original file
    cp "$texfile" "${texfile}.bak"

    # Enable solutions (SOL version)
    # Uncomment or add \printanswers before \begin{document}
    if ! grep -q '\\printanswers' "$texfile"; then
        # Add \printanswers just before \begin{document} if not present
        sed -i '' '/\\begin{document}/i \\\printanswers' "$texfile"
    else
        # Uncomment an existing \printanswers line if it’s commented out
        sed -i '' 's/%\\printanswers/\\printanswers/' "$texfile"
    fi

    # Compile the document with solutions
    lualatex -jobname="${basename}_Sol" "$texfile"
    lualatex -jobname="${basename}_Sol" "$texfile"

    # Restore the original file for the non-solution version
    mv "${texfile}.bak" "$texfile"

    # Compile the document without solutions (NOSOL version)
    lualatex -jobname="${basename}_Stud" "$texfile"
    lualatex -jobname="${basename}_Stud" "$texfile"
done