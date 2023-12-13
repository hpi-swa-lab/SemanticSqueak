*SemanticSqueak-examples
sesqExamplesFor: selector

	(selector findFeatures first = #build and: [selector numArgs = 1]) ifTrue:
		[^ {[self new perform: selector with: ToolBuilder default]}].
	^ super sesqExamplesFor: selector