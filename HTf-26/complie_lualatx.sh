#!/bin/bash

# Get the base name of the .tex file (without the extension)
basename="${1%.tex}"

# Check if a .bib file exists with the same basename or in the same directory
if [ -f "${basename}.bib" ] || [ -f "../Quellen.bib" ]; then
    # Run LuaLaTeX, BibTeX, and LuaLaTeX twice
    lualatex "$1"
    bibtex "${basename}"
    lualatex "$1"
    lualatex "$1"
else
    # Run LuaLaTeX only
    lualatex "$1"
    lualatex "$1"
fi