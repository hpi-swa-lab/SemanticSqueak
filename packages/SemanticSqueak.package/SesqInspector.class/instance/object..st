accessing
object: anObject

	self object == anObject ifTrue: [^ self].
	
	self inspector object: anObject.
	self resetConversation.