*SemanticSqueak-UI-Agent
sesqOpenConversationWithQuestion: question

	| conversation |
	conversation := SesqAgent new
		object: self;
		makeNewConversation.
	conversation addSystemMessage: 'Keep your answers as short as possible unless instructed otherwise. When possible, just answer a single word, number, or print string only. Instead of "the result is X", just say "X". If the user asks longer or more open questions, you can provide more detailed answers. Provide code in your reply if the user asks for it (e.g., when they ask "how can i do X", print out a tested code snippet to the chat).'.
	self sesqBootstrapConversation: conversation.
	conversation addUserMessage: question.
	^ conversation openAndComplete