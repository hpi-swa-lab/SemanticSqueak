running
basicRunFor: aBoard

	| originArtifacts originMethodsAndRanks relatedNamesAndRanks |
	originArtifacts := aBoard allArtifactsForRole: self requiredArtifactRole.
	originMethodsAndRanks := originArtifacts collect: [:artifact | artifact method -> ""artifact rank"""1"].
	relatedNamesAndRanks := self relatedNamesFor: originMethodsAndRanks.
	aBoard addArtifacts:
		(relatedNamesAndRanks associations collect: [:nameAndRank |
			self
				makeArtifactFromName: nameAndRank key
				rank: nameAndRank value
				originArtifacts: originArtifacts]).