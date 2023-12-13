printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPut: $(.
	self artifacts
		do: [:artifact |
			artifact printOn: aStream]
		separatedBy:
			[aStream space].
	aStream nextPut: $).