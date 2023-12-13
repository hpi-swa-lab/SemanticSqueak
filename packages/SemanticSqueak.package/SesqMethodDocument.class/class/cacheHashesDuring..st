acccessing method hashes
cacheHashesDuring: aBlock

	hashedMethods := self hashedMethods.
	^ aBlock ensure:
		[hashedMethods := nil]