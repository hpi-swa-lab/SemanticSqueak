private
serializeException: anException

	^ OrderedJsonObject new
		description: anException description;
		stack:
			((anException signalerContext stack copyUpTo: anException privHandlerContext) allButLast
				collect: #asString);
		yourself