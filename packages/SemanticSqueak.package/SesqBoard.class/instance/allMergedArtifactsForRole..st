accessing
allMergedArtifactsForRole: role
 
	| roleArtifacts |
	roleArtifacts := self allArtifactsForRole: role.
	
	^ ((roleArtifacts groupBy: [:artifact | artifact mergeKeyForRole])
		collect: [:group |
			group size = 1
				ifTrue: [group anyOne]
				ifFalse:
					[SesqMergedArtifact forArtifacts: group]])
		sorted: #rank descending undefinedLast