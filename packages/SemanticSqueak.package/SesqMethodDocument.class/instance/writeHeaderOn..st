fileIn/Out
writeHeaderOn: aStream

	aStream binary nextPutAll: self methodHash.