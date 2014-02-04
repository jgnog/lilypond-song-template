% This file contains the music for the voice
% It also contains the lyrics


voicemusic = \new Voice = "voice" {
  \relative c'' {
    \global
    \dynamicUp
    \autoBeamOff
    c4 d e f |
    g( b,) c2 |
    \bar "|."
  }
}

verse = \lyricmode {
  This is the lyrics.
  Oh__ yeah!
}
