accessing
isFollowingFocus: aBoolean

	aBoolean
		ifTrue: [self startFollowingFocus]
		ifFalse: [self stopFollowingFocus].