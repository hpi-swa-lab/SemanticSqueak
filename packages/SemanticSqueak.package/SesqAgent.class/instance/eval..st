functions
eval: aString
	"evaluate a Smalltalk expression (aka 'do it'). Note that all temporary variables from the expression are local to this evaluation and cannot be accessed again in later expressions."
	<function: eval(expression: string)>

	| printString result |
	result := self
		tryEval: aString
		withErrorDo: [:ex |
			^ self serializeExceptionVerbosely: ex].
	[printString := result printString]
		on: Error do: [:ex |
			^ OrderedJsonObject new
				note: 'Expression evaluated successfully, but could not print the result.';
				resultClass: result class printString;
				printStringError: (self serializeException: ex);
				yourself].
	^ JsonObject new
		result: printString;
		yourself