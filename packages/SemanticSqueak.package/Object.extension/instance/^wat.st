*SemanticSqueak-Core-Agent
? questionString

	^ self sesqAsk: (questionString findFeatures joinSeparatedBy: String space)