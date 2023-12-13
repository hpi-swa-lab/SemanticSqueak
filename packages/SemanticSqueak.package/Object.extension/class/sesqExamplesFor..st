*SemanticSqueak-examples
sesqExamplesFor: selector

	selector isUnary ifTrue:
		[^ {[self new perform: selector]}].
	
	(selector isKeyword and: [selector numArgs = 1] and: [selector findFeatures last = 'on']) ifTrue:
		[^ {[String streamContents: [:stream |
			self new perform: selector with: stream]]}].
	
	(selector isKeyword and: [selector numArgs = 1] and: [selector findFeatures first = 'draw']) ifTrue:
		[^ {[(Display defaultCanvasClass extent: 50 @ 40 depth: Display depth)
				in: [:canvas | self new perform: selector with: canvas]]}].
	
	^ {}