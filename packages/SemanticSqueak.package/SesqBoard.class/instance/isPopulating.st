populating
isPopulating

	^ processes anySatisfy: [:ea | ea isTerminated not]