running
basicRunFor: aBoard

	| originArtifacts originMethods similarMethods |
	originArtifacts := aBoard allArtifactsForRole: self requiredArtifactRole.
	originMethods := originArtifacts collect: [:artifact | artifact method].
	similarMethods := self similarMethodsFor: originMethods.
	aBoard addArtifacts:
		(similarMethods associations collect: [:methodAndRank |
			(SesqMethodArtifact for: methodAndRank key)
				artifactRole: #similarMethod;
				rank: methodAndRank value;
				originArtifact: (originArtifacts size = 1 ifTrue: [originArtifacts anyOne] ifFalse: [originArtifacts]);
				originStrategy: self;
				yourself]).