private
updateDraggedMorphs

	| newDraggedMorphs |
	newDraggedMorphs := self currentHand submorphs ifEmpty: [^ self].
	draggedMorphs addAll: newDraggedMorphs.
	self updateFocus: false.