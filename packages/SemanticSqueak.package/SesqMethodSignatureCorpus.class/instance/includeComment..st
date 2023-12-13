accessing
includeComment: aBoolean

	includeComment = aBoolean ifTrue: [^ self].
	self documents ifEmpty:
		[includeComment := aBoolean.
		^ self].
	
	self notify: 'If you change this property, you will need to recompute all documents!'.
	includeComment := aBoolean.
	self halt documents do: [:ea |
		ea includeComment: self includeComment].
	self initializeEmbeddings.