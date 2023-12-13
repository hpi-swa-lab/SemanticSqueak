accessing
allArtifactRoles

	^ (self allStrategies collect: [:strategy | strategy outputArtifactRole])
		asSet