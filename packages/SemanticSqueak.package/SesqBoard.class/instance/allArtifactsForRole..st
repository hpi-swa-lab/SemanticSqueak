accessing
allArtifactsForRole: role
 
	^ self allArtifacts select: [:artifact |
		artifact artifactRole = role]