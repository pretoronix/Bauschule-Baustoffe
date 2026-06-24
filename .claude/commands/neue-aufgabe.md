---
description: Legt ein neues nummeriertes Aufgaben-Skelett unter Unterlagen/<Thema>/Aufgaben/ an.
argument-hint: [Thema/Ordner] [Kurztitel der Aufgabe]
---

Erstelle eine neue Übungsaufgabe für die Unterlagen der Bauschule (Fach Baustoffe).

Eingabe des Nutzers: $ARGUMENTS

Vorgehen:
1. Bestimme das **Thema** (z.B. `05_Beton`, `09_Metalle`, `12_WDS`) und einen
   **Kurztitel**. Fehlendes kurz mit `AskUserQuestion` erfragen; liste bei Bedarf die
   vorhandenen Themenordner unter `Unterlagen/` auf.
2. Lege die Aufgabe unter `Unterlagen/<Thema>/Aufgaben/<NN_Kurztitel>/` ab. Bestimme die
   nächste freie laufende Nummer `<NN>` anhand der bestehenden Ordner. Lege bei Bedarf
   einen `Bilder/`-Unterordner an.
3. Erzeuge die `.tex` auf Basis von `template/Pruefung_starter.tex` (exam-Klasse mit
   `\question`/`\solution`/`\loesungsraum`) und passe den relativen `\input`-Pfad zu
   `template/BauschuleBS.tex` an die Ordnertiefe an.
4. Konventionen aus `CLAUDE.md` beachten: Schweizer Hochdeutsch, `siunitx`-Kurzbefehle,
   `\FinRes` fürs Schlussresultat, Bilder im `Bilder/`-Ordner.
5. Erstelle ein klares Gerüst mit Platzhaltern statt erfundener Inhalte und melde den Pfad
   der neuen Datei.
