copying
postCopy

	super postCopy.
	
	embeddingCache := LRUCache size: embeddingCache sesqSize factory: [:key | nil].