as yet unclassified
initialize

	super initialize.
	id := UUID new.
	properties := SesqDummyOrderProperties new.
	self properties entryAt: #creationDate put: DateAndTime now asUnixTime * 1000.
	self properties entryAt: #customer put: Utilities authorName.
	self properties entryAt: #invalidationDate put: (DateAndTime now + 1 week) asUnixTime * 1000.