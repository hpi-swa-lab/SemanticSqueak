updating
systemEvent: anEvent

	| method |
	anEvent itemKind = SystemChangeNotifier methodKind ifFalse: [^ self].
	anEvent isRecategorized ifTrue: [^ self].
	
	method := anEvent itemMethod methodReference ifNil: [^ self].
	
	self removeDocumentsFor: method.
	
	(self wantsMethod: method) ifFalse: [^ self].
	(anEvent isAdded or: [anEvent isModified]) ifTrue:
		[self addMethod: method].