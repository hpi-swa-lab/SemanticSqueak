initialize-release
initializeInstance

	instance := self new.
	instance addAllMethods. "if updateEmbeddings is interrupted, prior progress is not lost"