private
allArtifactRoles

	^ self board allArtifactRoles
		sorted:
			[:role | self artifactRoleOrder indexOf: role ifAbsent: []] ascending undefinedLast
				, [:role :otherRole | role compareSafely: otherRole]