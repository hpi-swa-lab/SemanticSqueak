running
runFor: aBoard

	self basicRunFor: aBoard.
	hasRun := true.
	aBoard tick.