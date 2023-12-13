*SemanticSqueak-literals
sesqAllSelectorLiterals

	^ Array streamContents: [:stream |
		| collector |
		collector := nil.
		collector := [:literal |
			literal isCollection ifTrue:
				[literal isSymbol
					ifTrue:
						[literal isMessageSelector ifTrue:
							[(stream position = 0 and: [literal = self selector]) ifFalse:
								[stream nextPut: literal]]]
					ifFalse:
						[literal isArray ifTrue:
							[literal do: collector]]]].
		
		self codeLiteralsDo: [:code |
			code literalsDo: collector]]