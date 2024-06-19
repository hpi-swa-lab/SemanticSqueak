*SemanticSqueak-Core-Agent
sesqBootstrapConversation: aConversation

	| eval |
	super sesqBootstrapConversation: aConversation.
	
	eval := aConversation defaultToolSpec toolNamed: 'eval'.
	
	(aConversation addAssistantMessage: '')
		toolCalls:
			{eval asToolCallWithArguments: {'"`self` is a `Context` object (a call frame in Squeak), which means that I am inspecting a suspended process right now. Now, I will explore the stack of that context. This eval will help me a lot understand the call stack and in many cases make later evals superfluous to answer questions by the user about the call stack. Note that this stack is most-recent-call-FIRST, i.e., the last item on the stack was created first."
((self stack take: 10) collect: [:context | {#context -> context asString. #receiver -> (context receiver longPrintStringLimitedTo: 100). #variables -> (context tempsAndValuesContractedTo: 200). #method -> context method getSource asString} as: JsonObject] as: Array) asJsonString'}}.
	aConversation resolveAllToolCalls.
	
	"aConversation addSystemMessage: 'Continue by thinking aloud to analyze the call stack. Take a deep breath and explain what you are seeing and understanding before you finally answer the original question.'."
	
	"answer in one sentence! ''what does it do'' means look into the source of the block"
	
	aConversation addSystemMessage: 'Keep your answer short and concise (half sentences or max 2 sentences)! Be specific. Browse relevant methods and avoid speculation. Do not print out entire methods in your reply unless explicitly requested.'.