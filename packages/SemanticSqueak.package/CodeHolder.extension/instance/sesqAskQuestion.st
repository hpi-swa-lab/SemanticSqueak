*SemanticSqueak-menus
sesqAskQuestion

	| class question |
	class := self selectedClass.
	question := Project uiManager chooseFromOrAddTo: #('list class responsibilities' 'list collaborators of this class') lines: #() title: ('Ask {1}' format: {class}).
	question isEmptyOrNil ifTrue: [^ self].
	^ class sesqOpenConversationWithQuestion: question