private
serializeExceptionVerbosely: anException

	^ OrderedJsonObject new
		at: #error put: (self serializeException: anException);
		in: [:response |
			((anException isKindOf: MessageNotUnderstood) "and: [anException signalerContext sender selector isDoIt]") ifTrue:
				[response note: 'A common source of MessageNotUnderstood errors is that some brackets were missed to separate messages from each other. E.g., `myArray select: [:x | x notNil] collect: [:x | x customer]` must be corrected to `(myArray select: [:x | x notNil]) collect: [:x | x customer]`, and `myArray select: [:x | x notNil] , otherArray` must be corrected to `(myArray select: [:x | x notNil]) , otherArray`.']];
		yourself