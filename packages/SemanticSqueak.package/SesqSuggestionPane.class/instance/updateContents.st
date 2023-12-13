private
updateContents

	self hasUnacceptedEdits ifTrue: [^ self changed: #codeChangedElsewhere].
	
	self contents: (Text streamContents: [:stream |
		stream withAttributes: {TextEmphasis bold. TextEmphasis underlined} do:
			[stream nextPutAll: ((self artifactRole asPluralBasedOn: Float infinity) findFeatures joinSeparatedBy: Character space) capitalized.
			stream nextPutAll: (' ({1})' format: {self artifactTexts size}).
			self isSearching ifTrue:
				[stream nextPutAll: ' (searching...)']].
		stream cr; cr.
		
		(self artifacts sorted: #rank descending undefinedLast)
			do: [:artifact | stream nextPutAll: (self artifactTexts at: artifact)]
			separatedBy: [stream cr; cr]]).
	self contentsChanged.