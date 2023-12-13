private
updateFocus: honorKeyboard

	| window |
	window := (honorKeyboard ifTrue: [self currentHand keyboardFocus ifNotNil: [:m | m containingWindow]])
		ifNil: [SystemWindow topWindow].
	window ifNil: [^ self].
	(self wantsWindow: window) ifTrue:
		[self focus: window].