toolbuilder
buildValuePaneWidgetWith: builder

	^ self hasConversationSelected
		ifTrue: [self buildConversationPaneWith: builder]
		ifFalse:
			[self flag: #workaround. "#aboutToStyle: does not work for the initial text because MorphicToolBuilder initializes #knownName after getTextSelector"
			Project current addDeferredUIMessage: [self inspector changed: #contents].
			
			self inspector buildValuePaneWith: builder]