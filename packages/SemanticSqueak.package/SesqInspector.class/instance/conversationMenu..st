menus
conversationMenu: menu

	menu addTitle: self conversationEditor shortLabelString.
	
	menu add: 'open' target: self selector: #openConversation.
	menu add: 'inspect' target: self selector: #inspectConversation.
	menu add: 'reset' target: self selector: #resetConversation.
	
	self conversationEditor addModelItemsToWindowMenu: menu.
	
	^ menu