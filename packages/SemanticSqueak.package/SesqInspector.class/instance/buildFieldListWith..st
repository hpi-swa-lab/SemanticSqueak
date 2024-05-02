toolbuilder
buildFieldListWith: builder

	^ builder pluggableListSpec new
		model: self;
		list: #fieldList;
		getIndex: #sesqSelectionIndex;
		setIndex: #sesqSelectionIndex:;
		autoDeselect: true;
		menu: #fieldListMenu:shifted:;
		dragItem: #dragFromFieldList:;
		dragType: #dragTypeInFieldListAt:;
		dropItem: #dropOnFieldList:at:shouldCopy:;
		keyPress: #inspectorKey:from:;
		yourself