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
  system-system-spacing = #'((basic-distance . 10) (minimum-distance . 7))
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
    \context {
      \PianoStaff
      \override StaffGrouper.staff-staff-spacing =
        #'(
            (minimum-distance . 5)
            (padding . 0.6)
          )
    }
    \context {
      \Lyrics
      % Reduce vertical spacing between stanzas
      \override VerticalAxisGroup.nonstaff-nonstaff-spacing =
        #'(
            (minimum-distance . 2.4)
            (padding . 0.2)
          )
      % Reduce vertical spacing vocal staff -- lyrics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'(
            (padding . 0.4)
          )
      % Reduce vertical spacing lyrics -- piano
      \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing =
        #'(
            (padding . 1.0)
          )
    }
    \context {
      \Dynamics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'(
            (basic-distance . 5)
            (minimum-distance . 0)
            (padding . 0.4)
          )
    }
  }
}
