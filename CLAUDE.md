# CLAUDE.md

Leitfaden für die Arbeit mit Claude Code in diesem Repository.

## Projektüberblick

Dieses Repository enthält Lehrmaterialien für das Fach **Baustoffe** an der
**Bauschule** – Lektionsprogramme (Folien), Prüfungen, Aufgabenblätter,
Lernziele und Unterlagen. Alles ist in **LaTeX** verfasst (deutsche Sprache,
Schweizer Variante) und wird mit **LuaLaTeX** kompiliert (pdfLaTeX als
Fallback).

## Verzeichnisstruktur

- `template/` – Zentrale LaTeX-Vorlagen und Logos (siehe unten).
- `Unterlagen/` – Fachinhalte, nach Themen nummeriert (z.B. `05_Beton`,
  `09_Metalle`, `12_WDS`). Jeder Ordner enthält oft `Aufgaben/`, `Bilder/`
  und ggf. `*.md`-Notizen.
- `HTf-26/`, `HTg-26/`, `HTa-26/` – Klassen-spezifische Materialien
  (Lektionsprogramme `KW_XX_Programm.tex`, Prüfungen unter `Exams/`,
  Lernziele, Nachbesprechungen).
- `Lehrerkurs/` – Lehrkonzept und Unterrichtsbesuch.

## Vorlagen (`template/`)

| Datei | Zweck | Dokumentklasse |
|-------|-------|----------------|
| `BauschuleBS.tex` | Prüfungen und Aufgabenblätter | `exam` |
| `beamer_BS.tex` | Lektionsprogramme / Folien | `beamer` |
| `Programm_starter.tex` | Startvorlage für ein Wochenprogramm | (nutzt `beamer_BS.tex`) |
| `Pruefung_starter.tex` | Startvorlage für eine Prüfung | (nutzt `BauschuleBS.tex`) |

Eingebunden werden die Vorlagen per `\input{<relativer Pfad>/template/BauschuleBS.tex}`
bzw. `.../template/beamer_BS.tex`. Den Pfad an die Tiefe des Dokuments anpassen.

## Kompilieren

Es gibt keinen zentralen Build. Einzelne Dokumente werden mit LuaLaTeX gebaut:

```bash
lualatex Dateiname.tex      # ggf. zweimal für Verweise/Inhaltsverzeichnis
```

Manche Ordner enthalten ein `compile_lualatex.sh`, das alle `*.tex` im
Ordner kompiliert. Beamer-Folien stellen über `\def\customoptions{...}`
ggf. das Seitenformat ein (z.B. `aspectratio=169`).

### Prüfungen: Aufgaben- vs. Lösungsversion

Die `exam`-Vorlage unterscheidet zwei Versionen über `\printanswers`:

- **auskommentiert** → Aufgabenversion (Lösungen ausgeblendet)
- `\printanswers` aktiv → Lösungsversion (Lösungen in Bauschule-Blau)

## Konventionen

- **Sprache:** Deutsch, Schweizer Hochdeutsch (z.B. „ss" statt „ß").
- **Fonts:** Aptos (Bauschule-CI) unter LuaLaTeX; Helvetica als pdfLaTeX-Fallback.
- **CI-Farbe:** `blau_bauschule` (RGB 22,65,148 in der Prüfungs-, leicht
  abweichend in der Beamer-Vorlage). Für Hervorhebungen diese Farbe nutzen.
- **Einheiten:** immer mit `siunitx` (`\SI{...}{...}`) bzw. den
  Kurzbefehlen unten – nicht von Hand setzen.
- **Bilder:** in einen `Bilder/`-Unterordner legen und mit `\quelle{...}`
  (Folien) belegen, wenn eine Quelle nötig ist.
- **Neue Lektion/Prüfung:** von der passenden `*_starter.tex` ausgehen statt
  ein altes Dokument zu kopieren.

## Wichtige Makros

### Gemeinsam (beide Vorlagen)
- `\myNmm{30}` → Festigkeit in N/mm² (`\SI`).
- `\FinRes{...}` → doppelt unterstrichenes Schlussresultat.

### Prüfungen (`BauschuleBS.tex`)
- `\punkte{...}` → Punkteverteilungs-Box.
- `\pagebreaksol` / `\pagebreakexam` → Seitenumbruch nur in der
  Lösungs- bzw. Aufgabenversion.
- `\solutiontable{...}` → Lösung in Tabellen einfärben.
- `\loesungsraum{5}` → 5 linierte Antwortzeilen (nur Aufgabenversion). *(neu)*
- `\mydichte{2400}` → kg/m³, `\mygradC{20}` → °C,
  `\mylambda{0.04}` → W/(m·K). *(neu)*
- `\bsHervorheb{...}` → fett in Bauschule-Blau. *(neu)*

### Folien (`beamer_BS.tex`)
- `\BlueSectionSlide` → blaue Abschnitts-Trennfolie.
- `\folieFragen` → Standardfolie „Fragen zur letzten Lektion".
- `\naechstePruefung{Datum}{Thema}` / `\pruefung{Thema}{Minuten}{Link}`.
- `\notenverteilung{min}{median}{mittel}{max}{std}`, `\notenformel{...}{...}{...}`.
- `\frageMitZweiFolien{Titel}{Frage}{richtig|falsch}` → Frage + Lösungsfolie.
- Boxen: `Merke`, `Anwendungen`, `Definition_BS`, `Masseinheit`,
  `myLösung`, `myLernziele`, `Fragenblock`.
- `\quelle{...}` → kleine graue Quellenangabe. *(neu)*
- Boxen `Beispiel` und `Achtung`. *(neu)*
- `\bildFrame[Quelle]{Titel}{Breite}{Pfad}` → Folie mit zentriertem Bild. *(neu)*
- `\zweiSpaltenFrame{Titel}{links}{rechts}` → zweispaltige Folie. *(neu)*

## Hinweise / Stolpersteine

- In `beamer_BS.tex` ist der Logo-Pfad **absolut** auf eine lokale Maschine
  gesetzt (`/Users/patricpf/...`). Auf anderen Systemen muss dieser Pfad
  angepasst werden, sonst schlägt das Logo (bzw. die Kompilierung) fehl.
- Es gibt kein automatisiertes Test-/Lint-Setup; Korrektheit wird durch
  erfolgreiches Kompilieren der jeweiligen Dokumente geprüft.
- Änderungen an den Vorlagen wirken auf **viele** Dokumente – nur additiv
  erweitern und bestehende Makros nicht umdefinieren.
