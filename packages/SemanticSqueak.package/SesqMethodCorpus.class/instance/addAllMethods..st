construction
addAllMethods: methodReferences

	self class cacheSourcesDuring:
		[methodReferences do: [:methodReference |
			self addDocumentFor: methodReference]].
	self processPendingMethods.