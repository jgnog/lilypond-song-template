% This file contains the music for the piano.
% It also contains the "music" for the Dynamics context
% between staves of the piano.

rightmusic = \relative c' {
  \global
  <c e g>2 <e g c> |
  <d g b> <e g c> |
}

leftmusic = \relative c' {
  \global
  c,2 c |
  g c |
}

pianodynamics = {
  s2\p\< s\> |
  s1\pp
}

