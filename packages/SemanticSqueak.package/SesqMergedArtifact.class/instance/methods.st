accessing
methods

	^ (self artifacts select: [:artifact | artifact respondsTo: #method])
		collect: [:artifact | artifact method]
		as: Set