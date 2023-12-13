updating
refreshBoardAround: aBlock

	self board
		stopPopulating;
		removeAllArtifacts.
	self resetArtifacts.
	
	aBlock value.
	
	methodArtifact ifNotNil:
		[self board
			addArtifact: methodArtifact;
			startPopulating].
	self changed: #isSearching.