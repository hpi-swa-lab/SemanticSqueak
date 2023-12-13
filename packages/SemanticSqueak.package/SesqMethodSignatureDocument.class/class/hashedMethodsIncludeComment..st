acccessing method hashes
hashedMethodsIncludeComment: includeComment

	| localHashedMethods |
	hashedMethods ifNotNil:
		[hashedMethods at: includeComment ifPresent: [:methods | ^ methods]].
	
	localHashedMethods := Dictionary new.
	Project uiManager informUser: 'Hashing methods...' during:
		[SesqMethodCorpus cacheSourcesDuring:
			[self systemNavigation allSelectorsAndMethodsDo: [:class :selector :compiledMethod |
				localHashedMethods at: (self methodHashFor: compiledMethod methodReference includeComment: includeComment) put: compiledMethod methodReference]]].
	^ localHashedMethods