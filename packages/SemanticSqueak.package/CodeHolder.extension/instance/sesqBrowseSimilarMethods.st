*SemanticSqueak-menus
sesqBrowseSimilarMethods

	| method similarMethods |
	method := self sesqSelectedMethod ifNil: [^ nil].
	similarMethods := method sesqSimilarMethods: 50.
	^ (Preferences traceMessages ifTrue: [MessageTrace] ifFalse: [MessageSet])
		sesqOpenOrderedMessageList: similarMethods
		name: ('Similar sending methods to {1}' format: {method asString})
		autoSelect: nil