accessing
focus: aMorphOrNil

	focus == aMorphOrNil ifFalse:
		[focus := aMorphOrNil.
		self triggerEvent: #focusChanged with: focus].
	
	self triggerEvent: #focus with: focus.