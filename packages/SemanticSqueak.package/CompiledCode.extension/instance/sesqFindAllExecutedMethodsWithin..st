*SemanticSqueak
sesqFindAllExecutedMethodsWithin: timeoutOrNil

	| block simulator |
	simulator := SesqMethodHarvestingSimulator new.
	block := [simulator evaluate:
		[[self methodClass sesqRunExamplesFor: self selector]
			on: Error , Warning, Halt do: [:ex | ex]]].
	[timeoutOrNil
		ifNil: [block value]
		ifNotNil: [block valueWithin: timeoutOrNil onTimeout: []]]
			on: Error , Warning , Halt do: [:ex |
				"known issue with B2DPlugin:  https://github.com/OpenSmalltalk/opensmalltalk-vm/issues/670"
				(((ex signalerContext stack at: 4) method == (Context >> #tryNamedPrimitiveIn:for:withArgs:) and: [((ex signalerContext stack at: 4) namedTempAt: 4 "ec") = 106])
					"SimulationSideEffect"
					or: [(ex isKindOf: Warning) and: [(ex signalerContext stack at: 2) method == (Context >> #doPrimitive:method:receiver:args:) and: [(ex signalerContext stack at: 2) tempAt: 1 "primitiveIndex" = 19]]])
						ifFalse: [ToolSet debugException: ex]].
	^ simulator methodsFor: self