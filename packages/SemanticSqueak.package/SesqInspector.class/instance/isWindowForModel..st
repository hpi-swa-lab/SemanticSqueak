forwarding - window
isWindowForModel: aModel
	"This is to establish the receiver as a dependent/view to the inspector so it can say #codeTextPane etc. as usual."

	(super isWindowForModel: aModel) ifTrue: [^ true].
	
	^ self containingWindow notNil and:
		[{self conversationEditor. self inspector} includes: aModel]