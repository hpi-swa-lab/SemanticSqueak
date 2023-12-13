*SemanticSqueak-examples
sesqRunExamplesFor: selector

	^ (self sesqExamplesFor: selector) do: [:ea |
		ea value]