initialize-release
initialize

	super initialize.
	
	self inspector: Inspector new.
	conversationEditor := SemanticConversationEditor new.
	conversationEditor mode: #minimal.
	conversationEditor addDependent: self.
	
	selectionIndex := 0.