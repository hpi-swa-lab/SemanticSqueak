*SemanticSqueak-Core-Agent
sesqBootstrapConversation: aConversation

	| eval |
	super sesqBootstrapConversation: aConversation.
	
	eval := aConversation defaultToolSpec toolNamed: 'eval'.
	
	(aConversation addAssistantMessage: '`self` represents a profiling trace. Let me continue by retrieving and analyzing the entire trace data.')
		toolCalls:
			{eval asToolCallWithArguments: {'String streamContents: [:stream | self report: stream])'}}.
	aConversation resolveAllToolCalls.