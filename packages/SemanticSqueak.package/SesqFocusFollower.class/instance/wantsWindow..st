testing
wantsWindow: aWindow

	^ (self predicate ifNil: [^ true]) value: aWindow