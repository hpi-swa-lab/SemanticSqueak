accessing
stopFollowingFocus

	focusFollower ifNil: [^ self].
	
	focusFollower stop.
	focusFollower := nil.
	
	self changed: #isFollowingFocus.