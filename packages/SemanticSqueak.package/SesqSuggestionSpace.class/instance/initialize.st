initialize-release
initialize

	super initialize.
	
	self board: self makeNewBoard.
	suggestionPanes := self allArtifactRoles
		collect: [:role | role -> (self makeNewSuggestionPaneFor: role)]
		as: Dictionary.
	self visibleArtifactRoles: self allArtifactRoles.
	self isFollowingFocus: self defaultIsFollowingFocus.