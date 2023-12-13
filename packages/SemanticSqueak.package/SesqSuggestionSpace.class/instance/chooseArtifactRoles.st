actions
chooseArtifactRoles

	| allRoles newRoles |
	allRoles := self allArtifactRoles.
	newRoles := Project uiManager
		tdbChooseMultipleFrom: allRoles
		title: 'Choose strategies'
		initialSelection: (self visibleArtifactRoles ifNil: [allRoles]).
	newRoles ifNil: [^ self].
	
	self visibleArtifactRoles: newRoles.