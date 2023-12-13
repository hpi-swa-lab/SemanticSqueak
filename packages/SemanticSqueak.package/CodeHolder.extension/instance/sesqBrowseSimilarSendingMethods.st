*SemanticSqueak-menus
sesqBrowseSimilarSendingMethods

	| method similarMethods |
	method := self sesqSelectedMethod ifNil: [^ nil].
	similarMethods := method sesqSimilarSendingMethods.
	^ (Preferences traceMessages ifTrue: [MessageTrace] ifFalse: [MessageSet])
		sesqOpenOrderedMessageList: similarMethods
		name: ('Similar methods to {1}' format: {method asString})
		autoSelect: nil