---
description: Erzeugt fertige Beamer-Folien (Bild, Definition, Merke, zwei Spalten, Frage) zum Einfügen.
argument-hint: [Folientyp] [Inhalt/Thema]
---

Erzeuge eine oder mehrere fertige Beamer-Folien für ein Lektionsprogramm der Bauschule,
die direkt in eine `KW_XX_Programm.tex` eingefügt werden können.

Eingabe des Nutzers: $ARGUMENTS

Vorgehen:
1. Bestimme **Folientyp** und **Inhalt**. Unterstützte Typen (sonst kurz nachfragen):
   - **bild** → `\bildFrame[Quelle]{Titel}{0.7\textwidth}{Bilder/<datei>}`
   - **definition** → `Definition_BS`-Box in einem `frame`
   - **merke** → `Merke`-Box
   - **beispiel** → `Beispiel`-Box
   - **achtung** → `Achtung`-Box
   - **zweispalten** → `\zweiSpaltenFrame{Titel}{links}{rechts}`
   - **frage** → `\frageMitZweiFolien{Titel}{Frage}{richtig|falsch}`
   - **lernziele** → `myLernziele`-Box mit Stichpunkten
2. Verwende ausschliesslich die in `template/beamer_BS.tex` definierten Makros/Boxen
   (siehe `CLAUDE.md`). Einheiten mit `\myNmm` & Co.
3. Schweizer Hochdeutsch („ss"). Quellen bei Bildern mit `\quelle{...}` bzw. dem optionalen
   Argument von `\bildFrame` angeben.
4. Frage, ob die Folie(n) in eine bestehende Datei eingefügt werden sollen (dann an
   passender `\section`/Stelle einfügen) oder nur als Code-Block ausgegeben werden sollen.
