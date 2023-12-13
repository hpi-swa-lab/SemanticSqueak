fileIn/Out
writeHeaderOn: aStream

	super writeHeaderOn: aStream.
	
	aStream binary.
	aStream nextPut: self includeComment asBit.