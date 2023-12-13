printing
printTextContentOn: aStream

	aStream withAttribute: TextEmphasis bold do:
		[aStream print: self selector].