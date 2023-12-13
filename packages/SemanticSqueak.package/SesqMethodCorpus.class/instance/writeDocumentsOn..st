fileIn/Out
writeDocumentsOn: aStream

	^ self class cacheSourcesDuring:
		[super writeDocumentsOn: aStream]