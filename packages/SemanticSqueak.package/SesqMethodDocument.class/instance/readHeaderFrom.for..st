fileIn/Out
readHeaderFrom: aStream for: aCorpus

	| hash |
	hash := aStream binary next: 20.
	
	self method: (self class methodForHash: hash ifAbsent: [hash halt]).