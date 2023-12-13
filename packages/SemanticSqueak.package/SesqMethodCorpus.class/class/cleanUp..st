initialize-release
cleanUp: aggressive

	aggressive ifTrue:
		[instance ifNotNil: [:corpus | corpus release].
		instance := nil].
	
	self subclassesDo: [:ea |
		ea cleanUp: aggressive].