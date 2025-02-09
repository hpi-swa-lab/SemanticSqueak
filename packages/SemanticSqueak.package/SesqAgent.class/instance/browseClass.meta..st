functions
browseClass: className meta: isMeta

	| class organizer |
	class := (self environment classNamed: className)
		ifNil: [self error: 'unknown class'].
	organizer := class organization.
	
	^ CurrentReadOnlySourceFiles cacheDuring: 
		[OrderedJsonObject new
			className: class name;
			definition: class definition asString withUnixLineEndings;
			comment: (class comment truncateWithEllipsisTo: 3000) asString withUnixLineEndings;
			categorizedSelectors:
				(organizer sesqSortedCategorizedElements collect: [:selectors |
					selectors collect: #printString]);
			in: [:result |
				isMeta ifFalse:
					[result superclass:
						(class superclass ifNotNil: [:superclass |
							superclass = Object
								ifFalse:
									[(self browseClass: superclass name)]
								ifTrue:
									[OrderedJsonObject new
										className: superclass name;
										yourself]]).
					result classSide:
						((self browseClass: class class name meta: true)
							removeKey: #comment;
							yourself)]];
			yourself]