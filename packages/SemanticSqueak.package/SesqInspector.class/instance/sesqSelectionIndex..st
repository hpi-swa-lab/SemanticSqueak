accessing
sesqSelectionIndex: anInteger

	| hadConversationSelected |
	hadConversationSelected := self hasConversationSelected.
	
	selectionIndex := anInteger.
	self inspector selectionIndex: (anInteger - 1 clampLow: 0).
	
	self changed: #sesqSelectionIndex.
	self hasConversationSelected = hadConversationSelected ifFalse:
		[self changed: #hasConversationSelected].