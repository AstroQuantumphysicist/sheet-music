\version "2.24.0"
\header {
  title = "Phantasmagoria"
  subtitle = "Toccata–Fantasia für Solo‑Piano"
  composer = "ChatGPT, 2025"
}

%-------- Pattern‑Definitionen ------------------------------------
patternIntroUpper = \relative c'' {
    r2 r4 c8->\pp ( g es c ) |
    g'4 ( c g es ) |
    r8 c, es g c es g c |
    bes16 ( g es' bes g' es bes' g ) |
}

patternIntroLower = \relative c {
    c1\pp\arpeggio |
    g'2 es |
    c1~ |
    c4 r r2 |
}

patternOstinatoUpper = \relative c'' {
    r8 bes' g d bes g d |
    es4. g8 fis g a |
    bes16 c d es fis g a bes c d es fis |
    g8 f es d c bes a |
}

patternOstinatoLower = \relative c {
    g8 d' g, d' g, d' g, |
    bes, bes' fis bes fis bes fis |
    es, bes' es, bes' es, bes' |
    d, a' d, a' d, a' |
}

patternIntermezzoUpper = \relative c'' {
    r8 bes,16 ( d f bes d f ) g8.~ g16 f ees |
    d8 bes g d bes d |
    ees4.~ ees8 d c |
    r4. r4. |
}

patternIntermezzoLower = \relative c {
    bes,16 f' d' bes f' d' bes f' d' bes f' |
    g, d' bes' g d' bes' g d' bes' |
    ees, bes' g' ees bes' g' ees bes' g' |
    r4. r4. |
}

patternStrettaUpper = \relative c'' {
    r16 c,, g' c es g bes c es g |
}

patternStrettaLower = \relative c {
    c,,8 c' g c' g |
}

%-------- Globale Einstellungen -----------------------------------
globalIntro     = { \key c \minor \time 4/4 }
globalFantasia  = { \key g \minor \time 7/8 }
globalIntermezzo = { \key bes \major \time 6/8 }
globalStretta   = { \key c \minor \time 5/8 }

%----------------------- Stimmen -----------------------------------
upper = {
    \clef treble
    % I. Introduzione – 12 Takte (3×4‑Takt‑Pattern)
    \globalIntro
    \repeat unfold 3 { \patternIntroUpper }

    % II. Fantasia agitata – 32 Takte (8×4‑Takt‑Pattern)
    \globalFantasia
    \repeat unfold 8 { \patternOstinatoUpper }

    % kleine Übergangs‑Modulation nach E‑Dur (2 Takte)
    \key e \major
    gis'2.\sfz-> fis8 e | dis8 cis bis cis dis e |

    % III. Lyrisches Intermezzo – 16 Takte (4×4‑Takt‑Pattern)
    \globalIntermezzo
    \repeat unfold 4 { \patternIntermezzoUpper }

    % IV. Stretta & Reprise – 36 Takte:
    %   35 Takte 5/8‑Stretta + 1 Takt 4/4‑Schluss
    \globalStretta
    \repeat unfold 35 { \patternStrettaUpper }
    \time 4/4
    <c,,, g' es' c'>1\fermata\fff
}

lower = {
    \clef bass
    % I. Introduzione
    \globalIntro
    \repeat unfold 3 { \patternIntroLower }

    % II. Fantasia agitata
    \globalFantasia
    \repeat unfold 8 { \patternOstinatoLower }
    \key e \major
    e2. b8 e | a,2. e'8 a |

    % III. Intermezzo
    \globalIntermezzo
    \repeat unfold 4 { \patternIntermezzoLower }

    % IV. Stretta & Reprise
    \globalStretta
    \repeat unfold 35 { \patternStrettaLower }
    \time 4/4
    c,,1\fermata
}

%----------------------- Partitur ----------------------------------
\score {
  \new PianoStaff <<
    \new Staff = "upper" \with { midiInstrument = "acoustic grand" } \upper
    \new Staff = "lower" \with { midiInstrument = "acoustic grand" } \lower
  >>
  \layout { }
  \midi { }
}
