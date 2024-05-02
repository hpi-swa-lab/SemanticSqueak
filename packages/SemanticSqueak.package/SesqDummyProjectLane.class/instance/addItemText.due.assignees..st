accessing
addItemText: aString due: aDateAndTime assignees: aCollection

	^ self addItem:
		(SesqDummyProjectItem newWithText: aString due: aDateAndTime assignees: aCollection)