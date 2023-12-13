updating
update: what

	what = #artifacts ifTrue:
		[self artifactsChanged].
	
	^ super update: what