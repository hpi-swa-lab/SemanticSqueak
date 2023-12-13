*SemanticSqueak-examples
sesqExamplesFor: selector

	selector isUnary ifTrue:
		[^ {[self soleInstance perform: selector]}].
	
	^ #()