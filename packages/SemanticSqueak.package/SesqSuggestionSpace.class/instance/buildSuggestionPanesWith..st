toolbuilder
buildSuggestionPanesWith: builder

	^ builder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		wantsResizeHandles: true;
		children: #buildSuggestionPanes;
		yourself