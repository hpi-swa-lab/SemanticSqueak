printing
printTextHeaderOn: aStream

	aStream withAttribute: TextEmphasis italic do:
		[self printOriginOn: aStream].
	self rank ifNotNil:
		[aStream space.
		aStream
			nextPut: $#;
			print: self rank maxDecimalPlaces: 3].