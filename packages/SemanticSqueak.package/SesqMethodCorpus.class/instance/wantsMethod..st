testing
wantsMethod: aMethodReference

	^ (self predicate ifNil: [^ true]) value: aMethodReference