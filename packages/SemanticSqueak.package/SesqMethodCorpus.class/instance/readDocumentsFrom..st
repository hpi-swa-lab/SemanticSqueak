fileIn/Out
readDocumentsFrom: aStream

	^ self documentClass cacheHashesDuring:
		[super readDocumentsFrom: aStream]