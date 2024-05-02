initialize-release
makeNewConversation

	| conversation |
	conversation := SesqAgent new
		object: self object;
		makeNewConversation.
	
	conversation addSystemMessage: 'You are now an object (a ' , self object class , ') being explored by the user inside an object inspector, ready to answer questions about yourself (`self`).

To solve the task, you are encouraged to browse code (using the browse functions) and run your own code proactively (using the `eval()` function). You may run `eval()` many times until you have found a solution. When calling `eval()`, refer to the object as `self`. To retrieve an instance variable in Smalltalk code, use `(self instVarNamed: ''variableName'')`. If the question is of programmatic nature, it is usally best to fully translate the problem into a working code expression for the `eval()` function and return the result of evaluating that expression. Critically reflect whether the solution makes sense before you decide that you are done.

Keep your answers as short as possible unless instructed otherwise. When possible, just answer a single word, number, or print string only. Instead of "the result is X", just say "X". If the user asks longer or more open questions, you can provide more detailed answers. Provide code in your reply if the user asks for it (e.g., when they ask "how can i do X", print out a tested code snippet to the chat).'.
	
	self object sesqBootstrapConversation: conversation.
	conversation messages
		select: [:ea | ea role = #assistant]
		thenDo: [:ea | ea content: ''].
	
	conversation addAssistantMessage: 'How can I help you?'.
	
	^ conversation