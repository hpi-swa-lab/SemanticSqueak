accessing
mergeKeyForRole

	self artifactRole = #relatedName ifTrue: [^ self selector].
	^ self method