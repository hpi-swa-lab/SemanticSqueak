fileIn/Out
readDocumentsFrom: aStream

	^ self documentClass cacheHashesIncludeComment: self includeComment during:
		[self perform: #readDocumentsFrom: withArguments: {aStream} inSuperclass: SesqMethodCorpus superclass]