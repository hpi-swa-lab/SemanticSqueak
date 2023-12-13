accessing - toolbuilder
menu: menu

	menu defaultTarget: self.
	
	menu
		add: 'choose strategies...' action: #chooseStrategies;
		add: 'choose artifact roles...' action: #chooseArtifactRoles.
	
	^ menu