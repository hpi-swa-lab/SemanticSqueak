updating
windowIsClosing

	super windowIsClosing.
	
	self conversationEditor windowIsClosing.
	self inspector windowIsClosing.