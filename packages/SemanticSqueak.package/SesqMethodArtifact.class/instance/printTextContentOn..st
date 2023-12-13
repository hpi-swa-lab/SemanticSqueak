printing
printTextContentOn: aStream

	| header rest |
	aStream withAttribute: TextEmphasis bold do:
		[aStream nextPutAll: self method classSymbol.
		self method classIsMeta ifTrue:
			[aStream nextPutAll: ' class'].
		aStream nextPutAll: '>>'].
	
	self method isValid
		ifFalse:
			[header := self method actualClass
				ifNil: [self method selector printString]
				ifNotNil: [:class | class standardMethodHeaderFor: self method selector].
			rest := 'Method vanished' readStream]
		ifTrue:
			[| source parser |
			source := self method sourceCode.
			source truncateWithEllipsisTo: 400.
			(parser := self method actualClass newParser) parseSelector: source.
			(TextStyler for: #Smalltalk) ifNotNil: [:stylerClass |
				source := stylerClass new
					classOrMetaClass: self method actualClass;
					styledTextFor: source asText].
			source := source readStream.
			header := (source next: parser endOfLastToken).
			rest := source].
	aStream nextPutAll: header.
	
	rest skipSeparators.
	rest peek = $" ifTrue:
		[| comment |
		comment := (rest next: 1) , (rest upTo: $") , (rest back; next: 1).
		comment := (comment copyReplaceAll: String cr with: String space)
			copyReplaceAll: String tab with: String empty.
		
		aStream cr; tab.
		aStream nextPutAll: comment].
	
	self shouldShowSource ifTrue:
		[rest skipSeparators.
		aStream cr; tab.
		(rest upToEnd withoutTrailingBlanks lines
			reject: [:line | line asString isAllSeparators])
				do: [:line | aStream nextPutAll: line]
				separatedBy: [aStream cr]].