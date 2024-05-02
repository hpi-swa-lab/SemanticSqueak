*SemanticSqueak-Core-Agent
sesqBootstrapConversation: aConversation

	| browseClass eval |
	eval := aConversation defaultToolSpec toolNamed: 'eval'.
	browseClass := aConversation defaultToolSpec toolNamed: 'browseClass'.
	
	(aConversation addAssistantMessage: 'First, I will acquire some general information about the object (`self`) and its class to understand the context of the question.')
		toolCalls:
			{eval asToolCallWithArguments: {'self'}.
			eval asToolCallWithArguments: {'self class'}.
			eval asToolCallWithArguments: {'self longPrintStringLimitedTo: 100'}.
			browseClass asToolCallWithArguments: {self class name}}.
	
	aConversation resolveAllToolCalls.