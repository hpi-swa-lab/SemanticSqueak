*SemanticSqueak-menus
sesqClassListMenu: menu
	<classListMenu>
	<menuPriority: 120>

	menu add: 'ask...' target: self action: #sesqAskQuestion.
	
	menu addLine.
	^ menu