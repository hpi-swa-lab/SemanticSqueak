function calling
serializeError: anException

	^ JsonObject new
		at: #error put: (self serializeException: anException);
		yourself