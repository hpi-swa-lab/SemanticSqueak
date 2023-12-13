running
resetStrategies

	scheduledStrategies removeAll.
	pendingStrategies removeAll.
	self strategies do: [:strategy | strategy reset].