filtering
filterEvent: anEvent for: rootMorph

	"recognize new editors already when attached to hand"
	anEvent isDraggingEvent ifTrue:
		[self future updateDraggedMorphs].
	self updateDroppedMorphs ifTrue:
		[self future updateFocus: false].
	
	(anEvent isKeystroke
		or: [anEvent isMouse and: [anEvent isMouseUp]]
		or: [anEvent isDropEvent])
			ifFalse:
				[^ anEvent].
	
	self future updateFocus: anEvent isKeyboard. "first let the event be handled"
	
	^ anEvent