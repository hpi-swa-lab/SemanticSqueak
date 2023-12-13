accessing
selectEditor: editor

	self isFollowingFocus: false.
	currentEditor := editor.
	
	self changed: #editor.
	self updateEditor.