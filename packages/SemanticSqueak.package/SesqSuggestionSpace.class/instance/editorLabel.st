accessing - toolbuilder
editorLabel

	self isFollowingFocus ifTrue:
		[^ self editor
			ifNil: ['(following focus)']
			ifNotNil: [:editor | 'following: {1}' format: {editor label}]].
	
	^ self editor
		ifNil: ['(select editor)']
		ifNotNil: [:editor | editor label]