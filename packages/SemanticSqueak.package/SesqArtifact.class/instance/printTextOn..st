printing
printTextOn: aStream

	self printTextHeaderOn: aStream.
	aStream space.
	self printTextActionsOn: aStream.
	aStream cr.
	
	self printTextContentOn: aStream.