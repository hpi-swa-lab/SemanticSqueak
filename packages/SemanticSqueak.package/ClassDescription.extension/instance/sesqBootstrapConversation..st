*SemanticSqueak-Core-Agent
sesqBootstrapConversation: aConversation

	super sesqBootstrapConversation: aConversation.
	
	aConversation addSystemMessage: 'When asked about the responsibilities of a class, BRIEFLY summarize the functionalities and methods of the class in conceptual groups. Do not write more than two or three sentences.'