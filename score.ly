\version "2.18.0"

\header {
  title = "Song title"
  subtitle = "Song subtitle"
  composer = "The Composer"
  poet = "The Poet"
  opus = "The Opus"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  %page-count = #2  % uncomment to force this number of pages
  %ragged-last-bottom = ##f  % uncomment to have music fill the last page
}

% Includes
% ========

\include "definitions.ily"
\include "voice.ily"
\include "piano.ily"

% Score
% =====

voicestaff = \new Staff = "voicestaff" \with {
  instrumentName = "Voice"
  midiInstrument = "clarinet"
} { \voicemusic }

lyricscontext = \new Lyrics = "lyrics" \with {
  % Lyrics the same font size as the music; default is 1
  \override LyricText.font-size = #0
} { \lyricsto "voice" { \verse } }

pianostaff = \new PianoStaff = "piano" \with {
  instrumentName = "Piano"
  midiInstrument = "acoustic grand"
  \accidentalStyle piano
} {
  <<
    \new Staff = "up" \rightmusic
    \new Dynamics = "pianodynamics" \pianodynamics
    \new Staff = "down" { \clef bass \leftmusic }
  >>
}

\score {
  <<
    \voicestaff
    \lyricscontext
    \pianostaff
  >>
  \midi {
    \tempo 4 = 60
  }
  \layout {
    #(set-global-staff-size 18)
  }
}
