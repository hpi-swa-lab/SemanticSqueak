*SemanticSqueak
sesqSignatureHash: includeComment

	| hash |
	hash := (SecureHashAlgorithm new hashMessage: (self sesqSignature: includeComment)) growto: 20.
	ByteArray adoptInstance: hash. "ByteArray is faster to compare, hash, and file out/in than LargePositiveInteger."
	^ hash