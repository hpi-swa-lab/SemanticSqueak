accessing
startFollowingFocus

	self stopFollowingFocus.
	
	focusFollower := SesqFocusFollower predicate: [:window | window model isKindOf: CodeHolder].
	focusFollower
		when: #focus send: #updateEditor to: self;
		when: #focusChanged send: #editor: to: self.
	self changed: #isFollowingFocus.