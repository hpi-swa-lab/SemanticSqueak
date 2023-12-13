*SemanticSqueak-private initializing
sesqInitializeMessageList: anArray
	super sesqInitializeMessageList: anArray.
	messageSelections := (Array new: messageList size withAll: false) asOrderedCollection.
	self 
		messageAt: messageListIndex
		beSelected: true.
	"autoSelectStrings is initialized right after this method, in autoSelectString:"
