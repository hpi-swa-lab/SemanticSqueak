accessing - toolbuilder
windowColorToUse

	self class useColorfulWindows ifTrue:
		[^ self userInterfaceTheme theme name
			caseOf: {['Squeak'] -> [self defaultWindowColor]}
			otherwise: [super windowColorToUse]].
		
	^ super windowColorToUse