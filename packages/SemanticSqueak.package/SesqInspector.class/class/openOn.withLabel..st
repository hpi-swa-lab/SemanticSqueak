as yet unclassified
openOn: anObject withLabel: label
	"Open an inspector with a specific label. Use this to set the inspector into context to explain why that object is inspected."

	^ ToolBuilder open: (self on: anObject) label: label