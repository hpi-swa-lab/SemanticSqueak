*SemanticSqueak-examples
sesqExamplesFor: selector

	selector isTestSelector ifTrue: [^ {[self debug: selector]}].
	^ super sesqExamplesFor: selector