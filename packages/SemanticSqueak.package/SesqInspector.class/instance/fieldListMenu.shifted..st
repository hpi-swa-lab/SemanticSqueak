menus
fieldListMenu: menu shifted: shifted

	self hasConversationSelected ifTrue:
		[^ self conversationMenu: menu].
	
	menu defaultTarget: self inspector.
	^ self inspector fieldListMenu: menu shifted: shifted