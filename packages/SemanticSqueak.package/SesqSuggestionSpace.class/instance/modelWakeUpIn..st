updating
modelWakeUpIn: aWindow

	| editorButton |
	super modelWakeUpIn: aWindow.
	
	editorButton := aWindow findDeepSubmorphThat: [:ea | ea knownName = #editor] ifAbsent: [^ self].
	editorButton
		on: #mouseEnter send: #highlightEditor to: self;
		on: #mouseLeave send: #unhighlightEditor to: self.