updating
updateEditor

	| method |
	self flag: #todo. "history"
	
	method := (self editor model ifNil: [^ self]) sesqSelectedMethod ifNil: [^ self].
	methodArtifact ifNotNil:
		[methodArtifact method = method ifTrue: [^ self]].
	
	self refreshBoardAround:
		[methodArtifact := SesqMethodArtifact for: method].