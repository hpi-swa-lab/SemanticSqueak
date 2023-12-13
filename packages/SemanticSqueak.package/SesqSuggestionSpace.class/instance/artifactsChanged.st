private
artifactsChanged

	self containingWindow ifNotNil: [:window |
		| id |
		id := thisContext.
		window setProperty: #sesqFlashRequest toValue: id.
		window color: ((self windowColorToUse alpha: 1) adjustSaturation: 0.8 brightness: 0) negated.
		([(window valueOfProperty: #sesqFlashRequest) == id
			ifTrue:
				[window color: self windowColorToUse.
				window removeProperty: #sesqFlashRequest]]
					future: 300) value].