*SemanticSqueak-instance creation
sesqOpenOrderedMessageList: messageList name: labelString autoSelect: autoSelectString
	"Open a system view for a MessageSet on messageList. 
	The labelString is passed to the model to use as a base label, depending on the selection state"

	| messageSet |
	messageSet := self sesqOrderedMessageList: messageList.
	messageSet
		autoSelectString: autoSelectString;
		setInitialLabel: labelString.
	^ToolBuilder open: messageSet