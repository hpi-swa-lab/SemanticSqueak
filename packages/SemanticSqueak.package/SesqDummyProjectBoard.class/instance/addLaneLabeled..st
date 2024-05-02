accessing
addLaneLabeled: aString

	^ self addLane:
		(SesqDummyProjectLane newWithLabel: aString)