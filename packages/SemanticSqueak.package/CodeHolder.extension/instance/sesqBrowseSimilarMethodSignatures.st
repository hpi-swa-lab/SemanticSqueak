*SemanticSqueak-menus
sesqBrowseSimilarMethodSignatures

	| method similarMethods |
	method := self sesqSelectedMethod ifNil: [^ nil].
	similarMethods := method sesqSimilarMethodSignatures: 50.
	^ (Preferences traceMessages ifTrue: [MessageTrace] ifFalse: [MessageSet])
		sesqOpenOrderedMessageList: similarMethods
		name: ('Similar method signatures to {1}' format: {method asString})
		autoSelect: nil