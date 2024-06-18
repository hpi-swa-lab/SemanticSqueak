conversation
forObject: anObject answerQuestion0: question

	| statusMessages conversation results statusMessageIndex |
	statusMessages := #('Thinking...' 'Still thinking...' 'Please have some patience...' 'Still on it...' 'Take a deep breath...' 'Dude, this can''t be so hard!').
	statusMessageIndex := 0.
	
	Project uiManager informUser: statusMessages first during: [:bar |
		self object: anObject.
		conversation := self makeNewConversation.
		conversation addSystemMessage: 'Answer the following question about the current object (`self`).

To solve the task, you are encouraged to browse code (using the browse functions) and run your own code proactively (using the `eval()` function). You may run `eval()` many times until you have found a solution. If the question is of programmatic nature, it is usally best to fully translate the problem into a working code expression for the `eval()` function and return the result of evaluating that expression. Critically reflect whether the solution makes sense before you decide that you are done. AFTER you have performed a detailed analysis, provide the final result using the `returnResult()` function.

RETURNING THE RESULT
It is important to note that the requestor who has raised the original question cannot read or access this chat itself. Instead, you MUST ALWAYS deliver your final result by calling the `returnResult()` function.
The `result` argument passed to that function should be a direct and machine-readable answer to the question (e.g., if the user asked for a number, return this number; if the user asked for some items, provide an array of strings or JSON objects; if the user asked for a summary, provide a string or array of strings). Whenever the question asks for something in plural, the result should be an array.
The `result` MUST contain all relevant data that are requested by the query.
Unless explicitly requested, avoid natural-language responses and never return full sentences. If the question indicates a specific format of the result, be sure to adhere to that format in the result provided to `returnResult()`.
Remember that you MUST NEVER write your answer to the chat only, but ALWAYS provide the final result by calling `returnResult()`.

Note that you cannot interact with the user. You MUST provide all requested information by calling `returnResult()`. DO NOT ask back any questions to the user.'.
		conversation addFunction: (SemanticFunction fromString: 'returnResult "Provide a result for the original query to the requestor." (result "A concise result, e.g., an array, a JSON object, or a simple string or value. Should NOT be an unstructured natural language text, but depending on the question, an array of short word groups is fine!")' action: [:args | results := {args result}]).
		
		conversation addUserMessage: question.
		conversation open.
		
		anObject sesqBootstrapConversation: conversation.
		
		[:exit |
			[results ifNotNil: [^ results first].
			(statusMessageIndex := statusMessageIndex + 1) = 1 ifFalse:
				[bar value: (statusMessages atWrap: statusMessageIndex)].
			conversation totalExpense maxCents > 50 ifTrue: [self notify: 'it''s getting expensive'].
			conversation getAssistantReply.
			conversation hasPendingToolCalls ifFalse: exit.
			conversation resolveAllToolCalls]
				repeat] valueWithExit.
		
		conversation addSystemMessage: 'Now call `returnResult()` with the result. Remember to format the result as a value or structured object and not natural language.'.
		conversation pushTools: #() force: #(returnResult).
		conversation getAssistantReply.
		conversation resolveAllToolCalls.
		results ifNotNil: [^ results first].
		^ conversation lastMessage content isThisEverCalled].