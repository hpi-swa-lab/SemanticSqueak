toolbuilder
buildSuggestionPanes

	| builder |
	builder := ToolBuilder default.
	^ self visibleArtifactRoles collect: [:role |
		self buildSuggestionPaneFor: role with: builder]