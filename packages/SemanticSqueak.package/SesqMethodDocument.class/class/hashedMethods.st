acccessing method hashes
hashedMethods

	| localHashedMethods |
	hashedMethods ifNotNil: [^ hashedMethods].
	
	localHashedMethods := Dictionary new.
	Project uiManager informUser: 'Hashing methods...' during:
		[SesqMethodCorpus cacheSourcesDuring:
			[self systemNavigation allSelectorsAndMethodsDo: [:class :selector :compiledMethod |
				localHashedMethods at: (self methodHashFor: compiledMethod methodReference) put: compiledMethod methodReference]]].
	^ localHashedMethods