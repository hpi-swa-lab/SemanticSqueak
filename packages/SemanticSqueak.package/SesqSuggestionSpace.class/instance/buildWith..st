toolbuilder
buildWith: builder

	| windowSpec |
	windowSpec := self buildWindowWith: builder specs:
		{LayoutFrame fullFrame
			bottomFraction: 0;
			bottomOffset: self buttonBarHeight;
			-> [self buildButtonBarWith: builder].
		LayoutFrame fullFrame
			topOffset: self buttonBarHeight;
			-> [self buildSuggestionPanesWith: builder]}.
	^ builder build: windowSpec