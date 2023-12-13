embeddings
initializeEmbeddingsFor: someDocuments

	| result |
	result := self class cacheSourcesDuring:
		[super initializeEmbeddingsFor: someDocuments].
	
	embeddingCache ifNotNil:
		[someDocuments do: [:document |
			embeddingCache 
				sesqAt: document methodHash
				put: document embedding]].
	
	^ result