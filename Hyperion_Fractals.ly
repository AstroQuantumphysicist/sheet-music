\version "2.24.0"
\header {
  title = "Hyperion Fractals"
  subtitle = "Grand Étude‑Toccata für Solo‑Klavier"
  composer = "ChatGPT, 2025"
  poet = "für wahre Draufgänger*innen der Tastatur"
}

%------------------ Globale Pattern‑ und Hilfsfunktionen -------------------
#(define RH \relative c'' )
#(define LH \relative c   )

% ------------------ Abschnitt I – Maelstrom (24 Takte) --------------------
globalI = { \time 12/8 \key c \minor }
maelstromUpper = RH {
  \clef treble
  % vier Takte pro Pattern
  \tuplet 7/6  { g32 bes d g bes d g } \tuplet 5/4 { es16 g bes d f }  c4->\fff |
  <f, a d fis>8 <e gis b dis> <d f a c> <c e g b> <b d f a> <a c es g> <g b d f> <fis a c es> <f as c es> <e g b d> <es g b d> <d f a c> |
  R1.*1 |
  <g'''' d' g d>4->\sfz <c,, c,>8 <ees'' b g ees> <a,,, a,,> <fis'' cis ais fis> <d,,, d,,> <f''' c a f> <e,,, e,,> <bes''' f d bes> <a,,, a,,> <gis''' d b gis> |
}

maelstromLower = LH {
  \clef bass
  % tiefe Wellenbewegung
  \sustainOn
  c,,1.~ |
  c,,1. |
  g,,,1.~ |
  g,,,1. |
  \sustainOff
}

% ------------------ Abschnitt II – Labyrinthine Adagio (20 Takte) ----------
globalII = { \time 5/4 \key gis \minor }
labyrinthUpper = RH {
  \clef treble
  % Zwei‑Takt‑Pattern: Polytonale Quarten‑Melodik + 17:16‑Polyrhythmus
  \tuplet 17/16 { gis32 a bis cis dis e fis gis a bis cis dis e fis gis a } b2.->\fff |
  r4 <dis, gis cis f>2.\arpeggio\> <e bis gis>4\! |
}

labyrinthLower = LH {
  \clef bass
  \mark \markup { \italic "una corda" }
  \tuplet 5/4 { gis,,16 dis' gis, dis' gis, } \tuplet 7/6 { cis,32 gis' cis, gis' cis, gis' cis, } gis,,2\> r4\! |
  <cis,,, gis' cis gis'>1\arpeggio r4 |
  \mark \markup { \italic "tre corde" }
}

% ------------------ Abschnitt III – Scherzo Frattale (30 Takte) -----------
globalIII = { \key d \major }
% alternierende Metren: 3/8 – 5/16 – 7/32
scherzoUpper = RH {
  \clef treble
  \time 3/8
  <fis'' d a>16 <a d fis> <b d g>\staccato |
  \time 5/16
  r32 <cis ais e> <d b g> <e cis a> <fis d b> |
  \time 7/32
  \tuplet 9/8 { g64 a b cis d e fis g a } |
}

scherzoLower = LH {
  \clef bass
  \time 3/8
  d,,8 fis a |
  \time 5/16
  r16 cis e g b |
  \time 7/32
  \tuplet 5/4 { a,,32 e' a, e' a, } <d,,, d,,>32 |
}

% ------------------ Abschnitt IV – Coda: Collapse (16 Takte) --------------
globalIV = { \time 4/4 \key c \major }
codaUpper = RH {
  \clef treble
  \sustainOn
  \repeat unfold 15 {
    <c''' g' e'>8 <g e c> <e c g> <c g e> <g e c> <e c g> <c g e> <g e c> |
  }
  \sustainOff
  % Letzter Takt
  <c'''' g'' e''>1\ff\fermata
}

codaLower = LH {
  \clef bass
  \sustainOn
  \repeat unfold 15 {
    <c,, g,, c,>8 <g,, c, g,> <e,, c, e,> <c,, g,, c,> <g,, c, g,> <e,, c, e,> <c,, g,, c,> <g,, c, g,> |
  }
  \sustainOff
  <c,,,, c,,, c,, c,>1\ff\fermata
}

% ------------------ Zusammenbau der vier Sektionen ------------------------
upper = {
  \globalI  \repeat unfold 6  { \maelstromUpper }
  \globalII \repeat unfold 10 { \labyrinthUpper }
  \globalIII \repeat unfold 10 { \scherzoUpper }
  \globalIV  \codaUpper
}

lower = {
  \globalI  \repeat unfold 6  { \maelstromLower }
  \globalII \repeat unfold 10 { \labyrinthLower }
  \globalIII \repeat unfold 10 { \scherzoLower }
  \globalIV  \codaLower
}

% ------------------ Partitur & Ausgabe ------------------------------------
\score {
  \new PianoStaff <<
    \new Staff = "upper" \with {
      midiInstrument = "acoustic grand"
    } \upper
    \new Staff = "lower" \with {
      midiInstrument = "acoustic grand"
    } \lower
  >>
  \layout { }
  \midi {
    \tempo 4 = 160
  }
}
