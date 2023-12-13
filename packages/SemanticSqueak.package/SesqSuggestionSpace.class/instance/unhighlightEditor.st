actions
unhighlightEditor

	self editor ifNotNil: [:editor | editor removeHalo].
	previousHalo ifNotNil: [:halo | halo target addHalo].