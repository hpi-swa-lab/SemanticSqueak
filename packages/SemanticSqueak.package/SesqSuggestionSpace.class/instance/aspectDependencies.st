updating
aspectDependencies

	^ OrderedDictionary new
		at: #buildSuggestionPanes put: #(visibleArtifactRoles);
		at: #editorLabel put: #(editor isFollowingFocus);
		at: #labelString put: #(isSearching);
		at: #windowTitle put: #(labelString);
		yourself