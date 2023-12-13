accessing
forHomeMethod: homeMethod registerMethod: aCompiledMethod

	(methods at: homeMethod ifAbsentPut: [OrderedCollection new])
		add: aCompiledMethod methodReference.