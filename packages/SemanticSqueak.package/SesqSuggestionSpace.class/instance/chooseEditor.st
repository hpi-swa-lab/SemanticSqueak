actions
chooseEditor

	| editor |
	editor := (Project uiManager
		chooseFromLabeledValues:
			(OrderedDictionary new
				at: '(autofocus)' put: [^ self isFollowingFocus: true];
				, (self allEditors
					collect: [:ea | ea label -> [ea]]
					as: OrderedDictionary))
		title: 'Please select editor')
			value ifNil: [^ self].
	
	self selectEditor: editor.