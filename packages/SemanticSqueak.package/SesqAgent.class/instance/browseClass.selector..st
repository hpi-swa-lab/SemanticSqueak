functions
browseClass: className selector: selectorString
	"get the full source code of the method className>>selector"
	<function: browseMethod(
		className: string "e.g., ""Object"" or ""Object class"" (for static class-side methods)",
		selector: string "e.g., ""copy"", ""at:put:"", or ""="""
	)>

	| class selector |
	class := (self environment classNamed: className)
		ifNil: [self error: 'unknown class'].
	selector := selectorString.
	(selector beginsWith: '#') ifTrue: [selector := selector allButFirst].
	selector := selector asSymbol.
	
	(class whichSuperclassSatisfies: [:superclass | superclass includesSelector: selector])
		ifNotNil: [:superclass |
			class := superclass].
	
	^ self sourceForClass: class selector: selector