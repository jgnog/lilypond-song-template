sources = score.ly definitions.ily voice.ily piano.ily

all: work publish

work: $(sources)
	lilypond score.ly

publish: $(sources)
	lilypond -dno-point-and-click score.ly
