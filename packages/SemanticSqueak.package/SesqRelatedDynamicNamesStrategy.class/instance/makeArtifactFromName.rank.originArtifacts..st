running
makeArtifactFromName: name rank: rank originArtifacts: originArtifacts

	^ (SesqMethodArtifact for: name)
		artifactRole: #relatedName;
		rank: rank;
		originArtifact: (originArtifacts size = 1 ifTrue: [originArtifacts anyOne] ifFalse: [originArtifacts]);
		originStrategy: self;
		yourself