updating
aspectDependencies

	^ OrderedDictionary new
		at: #buildValuePaneWidgets put: #(hasConversationSelected);
		at: #windowTitle put: #(labelString);
		yourself