# Shared latexmk configuration for the whole repository.
#
# VS Code (LaTeX Workshop) loads it via `-r %WORKSPACE_FOLDER%/latexmkrc`
# (see .vscode/settings.json). From a terminal, run in a document's folder:
#     latexmk -r <path-to-repo>/latexmkrc Datei.tex
#
# Effect: documents no longer need any paths to shared files:
#     \input{beamer_BS}                       -> template/beamer_BS.tex
#     \input{BauschuleBS}                     -> template/BauschuleBS.tex
#     \includegraphics{bauschule-logo-5cm}    -> template/bauschule-logo-5cm.png
#     \input{Unterlagen/50_Lernziele/08_WDS}  -> relative to the repo root

use Cwd qw(getcwd);
use File::Basename;

# Repo root = first parent folder of the document that contains template/.
# (__FILE__ is not usable here: latexmk evaluates rc files as strings.)
my $repo_root = getcwd();
$repo_root = dirname($repo_root) while ($repo_root ne '/' && !-d "$repo_root/template");

$pdf_mode = 4;   # build PDF with LuaLaTeX
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Search order: document folder (always first), template/, repo root, TeX defaults.
ensure_path('TEXINPUTS', "$repo_root/template//", "$repo_root/");
