*SemanticSqueak-menus
sesqMessageListMenu: menu
	<messageListMenu>

	(self selectedClass isNil or: [self selectedMessageName isNil]) ifTrue: [^ menu].
	
	^ menu addList: #(
		-
		('browse similar methods' sesqBrowseSimilarMethods)
		('browse similar method signatures' sesqBrowseSimilarMethodSignatures)
		('browse similar sending methods' sesqBrowseSimilarSendingMethods));
			yourself