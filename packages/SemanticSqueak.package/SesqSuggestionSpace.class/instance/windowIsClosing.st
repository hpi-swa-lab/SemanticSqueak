updating
windowIsClosing

	self stopFollowingFocus.
	focusFollower removeActionsWithReceiver: self.
	self board stopPopulating.
	self board removeActionsWithReceiver: self.
	
	^ super windowIsClosing