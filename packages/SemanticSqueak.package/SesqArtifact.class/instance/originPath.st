accessing
originPath

	self originArtifact ifNil: [^ {self}].
	
	^ {self}
		, (self originStrategy ifNil: [#()] ifNotNil: [:strategy | {strategy}])
		, self originArtifact originPath