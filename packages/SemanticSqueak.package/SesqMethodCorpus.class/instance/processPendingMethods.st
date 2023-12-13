private
processPendingMethods

	hasPendingMethods ifFalse: [^ self].
	isUpdatingMethods ifTrue: [^ self].
	hasPendingMethods := false. "when interrupted, must not start the operation again!"
	isUpdatingMethods := true.
	[[self updateEmbeddings]
		ensure: [isUpdatingMethods := false]]
			ifCurtailed: [hasPendingMethods := true "eventually reset flag"].