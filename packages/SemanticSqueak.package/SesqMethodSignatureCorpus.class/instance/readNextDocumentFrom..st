fileIn/Out
readNextDocumentFrom: aStream

	^ (super readNextDocumentFrom: aStream)
		includeComment: self includeComment;
		yourself