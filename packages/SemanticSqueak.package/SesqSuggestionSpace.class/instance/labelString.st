accessing - toolbuilder
labelString

	| title |
	title := 'Semantic Suggestions'.
	^ self isSearching
		ifFalse: [title]
		ifTrue: ['{1} (searching...)' format: {title}]