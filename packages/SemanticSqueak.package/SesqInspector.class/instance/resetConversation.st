actions
resetConversation

	self conversationEditor conversation: self makeNewConversation.
	Project current addDeferredUIMessage: [self conversationEditor addUserMessage].