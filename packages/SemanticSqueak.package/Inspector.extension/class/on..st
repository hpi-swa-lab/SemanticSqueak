*SemanticSqueak-UI-Inspector-instance creation-override
on: anObject 
	"Answer a new instance of me to provide an inspector for anObject."

	(SesqAgent integrateIntoInspectors and: [(self includesBehavior: BasicInspector) not]) ifTrue: [^ SesqInspector inspector: (self new object: anObject)].
	
	^ self new object: anObject