accessing
methodsFor: aCompiledMethod

	^ methods at: aCompiledMethod ifAbsent: [OrderedCollection new]