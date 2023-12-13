toolbuilder
buildSuggestionPaneFor: role with: builder

	^ (self suggestionPanes at: role)
		buildWith: builder