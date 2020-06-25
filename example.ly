\version "2.19"
\paper{
  #(define fonts
    (set-global-fonts
      #:music "BMusicFont"
      #:brace "profondo"
      #:roman "Academico"
  ))
}

\include "bmusicdefinitions.ily"

\header{
  title = "My wonderful composition"
  composer = "me"
  poet = "also me"
}

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  a4 b c d \clef "treble_8" a,4 b8 c16 d32 e64 f128
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  a2 c \clef "bass^15" c'''4 a,8 b16 c32 b64 c128
}

text = \lyricmode {
  Aaa Bee Cee Dee Oh, no, that hurts my ears!
}

\score {
  \new GrandStaff <<
    \new Staff = upper { \new Voice = "singer" \upper }
    \new Lyrics \lyricsto "singer" \text
    \new Staff = lower { \lower }
  >>
  \layout {
    \context {\Score \bravuraOn} 
    \context {
      \GrandStaff
      \accepts "Lyrics"
    }
    \context {
      \Lyrics
      \consists "Bar_engraver"
    }
  }
}

