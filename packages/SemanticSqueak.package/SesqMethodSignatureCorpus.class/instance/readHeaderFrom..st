fileIn/Out
readHeaderFrom: aStream

	super readHeaderFrom: aStream.
	
	aStream binary.
	self includeComment:
		(#(false true) at: aStream next + 1).