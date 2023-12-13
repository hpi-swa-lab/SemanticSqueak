initialize-release
initialize

	super initialize.
	
	self subscribeToSystemChanges.
	hasPendingMethods := false.
	embeddingCache := LRUCache size: 200 factory: [:key | nil].
	isUpdatingMethods := false.