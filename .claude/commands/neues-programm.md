---
description: Legt ein neues wöchentliches Lektionsprogramm (Beamer-Folien) an.
argument-hint: [Klasse] [KW] [Datum] [Thema]
---

Erstelle ein neues wöchentliches Lektionsprogramm für die Bauschule (Fach Baustoffe).

Eingabe des Nutzers (kann unvollständig sein): $ARGUMENTS

Vorgehen:
1. Bestimme die **Klasse** (z.B. `HTf-26`, `HTg-26`, `HTa-26`), die **Kalenderwoche** (KW),
   das **Datum** und das **Thema**. Was fehlt, frage kurz mit `AskUserQuestion` nach –
   schlage sinnvolle Defaults vor (aktuelle Klasse aus dem Repo, `\today`).
2. Kopiere `template/Programm_starter.tex` als Grundlage in den Klassenordner unter dem Namen
   `KW_<NN>_Programm.tex` (zweistellige KW, z.B. `KW_07_Programm.tex`). **Niemals** ein
   bestehendes Programm überschreiben – wenn die Datei existiert, melde das und frage nach.
3. Passe an:
   - den relativen `\input{...template/beamer_BS.tex}`-Pfad an die Ordnertiefe,
   - `\title`, `\author` (Patrick Pfändler) und `\date`,
   - `\section`/Folien grob auf das Thema.
4. Halte dich strikt an die Konventionen aus `CLAUDE.md` (Schweizer Hochdeutsch, „ss",
   `siunitx`-Kurzbefehle, Bauschule-Makros wie `\folieFragen`, `\BlueSectionSlide`,
   Boxen `Merke`/`Definition_BS`/`myLernziele`, `\bildFrame`, `\zweiSpaltenFrame`).
5. Erstelle nur das Gerüst mit klaren Platzhaltern – erfinde keine fachlichen Inhalte,
   wenn das Thema unklar ist. Zeige am Ende den Pfad der neuen Datei.

Wenn LaTeX (`lualatex`) verfügbar ist, kompiliere zur Kontrolle einmal und melde Fehler.
