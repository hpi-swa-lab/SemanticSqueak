*SemanticSqueak
sesqHash

	| hash |
	hash := (SecureHashAlgorithm new hashMessage: self sesqContent) growto: 20.
	hash := hash semChangeToByteArray. "ByteArray is faster to compare, hash, and file out/in than LargePositiveInteger and consumes less space on disk (as we only need 20 bytes)."
	^ hash