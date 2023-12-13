actions
highlightEditor

	previousHalo := self currentWorld someHalo.
	self editor ifNotNil: [:editor | editor isInWorld ifTrue: [editor addHalo]].