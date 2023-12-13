private
updateDroppedMorphs

	| change |
	change := false.
	draggedMorphs removeAllSuchThat: [:m |
		m owner isNil or:
			[m owner isHandMorph not
				ifTrue: [change := true];
				yourself]].
	^ change