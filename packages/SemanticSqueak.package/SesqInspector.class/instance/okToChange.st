testing
okToChange

	^ self conversationEditor okToChange
		and: [self inspector okToChange]
		and: [super okToChange]