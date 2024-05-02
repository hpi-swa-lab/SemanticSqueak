forwarding
dependentTextPaneWithSelector: aSelector
	"Copied from StringHolder."

	^ self dependents detect:
		[:aMorph | (aMorph isKindOf: PluggableTextMorph) and:
			[aMorph getTextSelector == aSelector]]
		ifNone: [nil]