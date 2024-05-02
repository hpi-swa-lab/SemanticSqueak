toolbuilder
buildConversationPaneWith: builder

	Project current addDeferredUIMessage:
		[(self conversationEditor anyTextPaneWithSelector: #text) ifNotNil:
			[self conversationEditor addUserMessage]].
	^ self conversationEditor buildTextPane: builder