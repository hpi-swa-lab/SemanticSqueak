forwarding
paneMorphSatisfying: aBlock

	^ (self containingWindow ifNil: [^ nil])
		paneMorphSatisfying: aBlock