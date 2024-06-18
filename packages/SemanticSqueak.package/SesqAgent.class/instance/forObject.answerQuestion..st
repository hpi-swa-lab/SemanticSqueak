conversation
forObject: anObject answerQuestion: question

	| statusMessages conversation results statusMessageIndex |
	statusMessages := #('Thinking...' 'Still thinking...' 'Please have some patience...' 'Still on it...' 'Take a deep breath...' 'Dude, this can''t be so hard!').
	statusMessageIndex := 0.
	
	Project uiManager informUser: statusMessages first during: [:bar |
		self object: anObject.
		conversation := self makeNewConversation.
		conversation addSystemMessage: 'Answer the user''s question about the current object (`self`).

To solve the task, follow this high-level process:
1. Gather required information by browsing code (using the browse functions) and running your own code proactively (using the `eval()` function). You may run `eval()` many times until you have found a solution.
2. If the question asks for objects or data:
   2a. Generate a final Smalltalk code expression that results in an answer to the original question (e.g., an object, a number, or an array). Run `eval()` with that expression.
   2b. Critically reflect whether the solution makes sense before you decide that you are done. Repeat and retry as often as required.
   2c. Return the final result for the original question by calling `evalAndReturn()` with the SAME expression that you have passed to `eval()` before. ALWAYS run the final expression using `eval()` BEFORE you pass it to `evalAndReturn()`.
3. If the question asks for a summary or explanation or other semantic information, provide a natural-language answer by calling `evalAndReturn()` with a string, array, or JsonObject. Keep the answer minimal and concise and prefer structured representations. Avoid full sentences. Instead of bullet points, return an array etc.

RETURNING THE RESULT
It is important to note that the requestor who has raised the original question cannot read or access this chat itself. Instead, you MUST ALWAYS deliver your final result by calling the `evalAndReturn()` function.
The `expression` argument passed to that function should return a result that is a direct answer to the question. Examples:
- If the user asked for a number, return the number.
- If the user asked for an object, return the object. To do this, provide a Smalltalk expression that retrieves just this object. NOT just a number.
- If the user asked for a summary, return a string or array of strings. If the user asked for a very detailed summary, you can also return a JSON object or an array of JSON objects.
- Whenever the question asks for something in plural, the expression result should be an array.
The result MUST contain all relevant data that are requested by the query.
Take care to provide a meaningful expression when calling `evalAndReturn()`, allowing the requestor to reproduce the evaluation later. In most cases, you should call `evalAndReturn()` with EXACTLY the same expression that you have used in an earlier `eval()` call. DO NOT hardcode any value result of an earlier `eval()`. UNDER NO CIRCUMSTANCES use a sole ID or print string like `a Morph(123456)` as the expression unless explicitly requested. You CANNOT access variables that you have assigned in any earlier expressions - you really need to recompute them.
Unless explicitly requested, avoid natural-language responses and never return full sentences. If the question indicates a specific format of the result, be sure to adhere to that format in the result provided to `evalAndReturn()`.
Remember that you MUST NEVER write your answer to the chat only, but ALWAYS provide the final result by calling or `evalAndReturn()`.

Note that you cannot interact with the user. You MUST provide all requested information by calling `evalAndReturn()`. DO NOT ask back any questions to the user.'.
		conversation addFunction: (SemanticFunction fromString: 'evalAndReturn "Evaluate a final Smalltalk expression (aka ''do it'') and provide the result as a return value for the original query to the requestor. The result of the expression can be any existing or new Smalltalk object, ranging from simple strings, values, booleans, `nil`, etc. to collections, domain-specific objects like morphs, or JSON objects (e.g., via `''{\"result\": 42}'' parseAsOrderedJson`). If the original query asks for an answer in the form of code or natural language such as an explanation or summary, the expression should just return a simple string - or an array or JsonObject of strings whenever the answer can be structured." (expression: string)' action: [:args |
			self
				tryEval: args expression
				withResultDo: [:result | results := {result}. 'done']
				withErrorDo: [:ex | self serializeExceptionVerbosely: ex]]).
		
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
		
		conversation addSystemMessage: 'Now call `evalAndReturn()` with the result. Remember to format the result as a value or structured object and not natural language.'.
		2 timesRepeat: "last chance to fix your own errors"
			[conversation pushTools: #() force: #(evalAndReturn).
			conversation getAssistantReply.
			conversation resolveAllToolCalls.
			results ifNotNil: [^ results first]].
		^ conversation lastMessage content isThisEverCalled].