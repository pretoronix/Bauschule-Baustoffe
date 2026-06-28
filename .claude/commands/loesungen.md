---
description: Kompiliert eine Prüfung in Aufgaben- und Lösungsversion (zwei PDFs).
argument-hint: [Pfad zur Prüfungs-.tex]
---

Erzeuge von einer Prüfung beide Versionen als getrennte PDFs: die **Aufgabenversion**
(ohne Lösungen) und die **Lösungsversion** (mit `\printanswers`, Lösungen in Bauschule-Blau).

Eingabe des Nutzers: $ARGUMENTS

Vorgehen:
1. Bestimme die Ziel-`.tex` (aus dem Argument; sonst kurz mit `AskUserQuestion` erfragen
   oder die zuletzt bearbeitete Prüfung vorschlagen). Es muss eine Datei sein, die
   `template/BauschuleBS.tex` einbindet.
2. Prüfe, ob `lualatex` verfügbar ist. Falls nicht, melde das klar und brich ab
   (kein Workaround erfinden).
3. **Aufgabenversion:** stelle sicher, dass `\printanswers` auskommentiert/entfernt ist,
   kompiliere mit `lualatex` (zweimal für Verweise) und benenne das PDF z.B.
   `<name>_Aufgaben.pdf`.
4. **Lösungsversion:** aktiviere `\printanswers`, kompiliere erneut zweimal und benenne das
   PDF `<name>_Loesungen.pdf`.
5. Stelle danach den ursprünglichen Zustand der `.tex` wieder her (verändere die
   Quelldatei nicht dauerhaft). Räume Hilfsdateien (`.aux`, `.log`, …) auf, falls die
   `.gitignore` sie nicht ohnehin ignoriert.
6. Melde die Pfade beider PDFs und etwaige Kompilierfehler.
