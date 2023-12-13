search-embeddings
findDocuments: number nearEmbedding: embedding useClusters: useClusters includeRanks: includeRanks

	self hasPendingMethods ifTrue: [self processPendingMethods].
	^ super findDocuments: number nearEmbedding: embedding useClusters: useClusters includeRanks: includeRanks