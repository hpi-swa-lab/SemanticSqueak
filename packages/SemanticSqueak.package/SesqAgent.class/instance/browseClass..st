functions
browseClass: className
	"get the definition, comment, and all method names ('selectors') of the class"
	<function: browseClass(className: string)>

	^ self browseClass: className meta: false