toolbuilder
buildConversationPaneWith: builder

	Project current addDeferredUIMessage:
		[(self conversationEditor anyTextPaneWithSelector: #text) ifNotNil:
			[self conversationEditor noteReadyForQuestion]].
	^ self conversationEditor buildTextPane: builder