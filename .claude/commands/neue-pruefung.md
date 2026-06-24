---
description: Legt eine neue Prüfung / ein Aufgabenblatt (exam-Klasse) an.
argument-hint: [Klasse] [Prüfungs-Nr] [Thema]
---

Erstelle eine neue Prüfung bzw. ein Aufgabenblatt für die Bauschule (Fach Baustoffe).

Eingabe des Nutzers (kann unvollständig sein): $ARGUMENTS

Vorgehen:
1. Bestimme **Klasse**, **Prüfungsnummer** und **Thema**. Fehlendes kurz mit
   `AskUserQuestion` erfragen.
2. Lege die Datei sinnvoll ab: in der Regel unter `<Klasse>/Exams/<NN_Thema>/` mit einem
   sprechenden Namen (z.B. `HTf_26_Pr07.tex`). Lege den Ordner an, falls nötig.
   **Niemals** eine bestehende Prüfung überschreiben.
3. Nutze `template/Pruefung_starter.tex` als Grundlage und passe an:
   - den relativen `\input{...template/BauschuleBS.tex}`-Pfad an die Ordnertiefe,
   - `\newcommand{\blattname}{Prüfung <NN>: <Thema>}`.
4. Beachte die Aufgaben-/Lösungs-Logik aus `CLAUDE.md`: `\printanswers` bleibt
   auskommentiert (= Aufgabenversion). Nutze für jede Aufgabe `\question[<Punkte>]`,
   `\begin{solution}...\end{solution}` für die Musterlösung und `\loesungsraum{<Zeilen>}`
   für Antwortzeilen. Einheiten immer über `siunitx`-Kurzbefehle
   (`\myNmm`, `\mydichte`, `\mygradC`, `\mylambda`), Schlussresultate mit `\FinRes{...}`.
5. Schweizer Hochdeutsch („ss"). Erstelle ein klares Gerüst mit Platzhaltern; erfinde keine
   fachlich falschen Aufgaben. Zeige am Ende den Pfad der neuen Datei.

Frage am Schluss, ob zusätzlich ein Lernziel-Blatt (analog zu vorhandenen
`*_Lernziele.tex`) angelegt werden soll.
