accessing
inspector: anInspector

	inspector ifNotNil: [inspector removeDependent: self].
	
	inspector := anInspector.
	
	inspector addDependent: self.
	
	conversationEditor ifNotNil: [self resetConversation].