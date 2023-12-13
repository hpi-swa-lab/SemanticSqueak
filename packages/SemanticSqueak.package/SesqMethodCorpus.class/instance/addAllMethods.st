construction
addAllMethods

	^ self addAllMethods:
		(self systemNavigation allMethodsSelect: [:compiledMethod |
			self wantsMethod: compiledMethod methodReference])