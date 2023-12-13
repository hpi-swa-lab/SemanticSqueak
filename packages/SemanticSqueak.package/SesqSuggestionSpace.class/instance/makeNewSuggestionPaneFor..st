initialize-release
makeNewSuggestionPaneFor: artifactRole

	^ (SesqSuggestionPane for: self artifactRole: artifactRole)
		updateContents;
		addDependent: self;
		yourself