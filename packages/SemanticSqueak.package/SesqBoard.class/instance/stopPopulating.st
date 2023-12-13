running
stopPopulating

	processes removeAllSuchThat: [:ea | ea terminate. true].
	
	self resetStrategies.