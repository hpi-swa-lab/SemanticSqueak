private
basicAddArtifacts: newArtifacts from: aBoard

	CurrentReadOnlySourceFiles cacheDuring:
		[artifacts removeAll.
		(aBoard allMergedArtifactsForRole: self artifactRole)
			do: [:artifact |
				self basicAddArtifact: artifact]].