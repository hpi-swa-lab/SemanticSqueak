private
tryEval: aString withResultDo: resultBlock withErrorDo: errorBlock

	| result |
	[result := Compiler evaluate: aString for: object]
		on: Error , Warning , Halt do: [:ex |
			^ errorBlock value: ex].
	^ resultBlock value: result