acccessing method hashes
cacheHashesIncludeComment: includeComment during: aBlock

	hashedMethods := self hashedMethodsIncludeComment: includeComment.
	^ aBlock ensure:
		[hashedMethods := nil]