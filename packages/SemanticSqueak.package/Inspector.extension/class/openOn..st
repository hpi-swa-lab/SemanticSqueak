*SemanticSqueak-UI-Inspector-instance creation-override
openOn: anObject
	"Open an inspector for anObject."
	
	(SesqAgent integrateIntoInspectors and: [(self includesBehavior: BasicInspector) not]) ifTrue: [^ SesqInspector openInspector: (self new object: anObject)].
	
	^ ToolBuilder open: (self on: anObject)