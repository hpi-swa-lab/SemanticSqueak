accessing
rank

	^ ((self artifacts collect: [:artifact | artifact rank]) copyWithout: nil)
		ifNotEmpty: [:ranks | ranks max]
		ifEmpty: [nil]