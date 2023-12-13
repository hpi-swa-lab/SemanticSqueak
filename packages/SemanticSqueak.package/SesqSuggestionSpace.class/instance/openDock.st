toolbuilder
openDock

	| window |
	window := self open.
	window openInWorld
		topRight: window world clearArea topRight;
		height: window world clearArea height.
	^ window