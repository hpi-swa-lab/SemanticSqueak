documentation
example

	| board christoph done pending |
	board := SesqDummyProjectBoard new.
	pending := board addLaneLabeled: 'pending'.
	done := board addLaneLabeled: 'done'.
	christoph := SesqDummyProjectPerson newWithName: 'Christoph'.
	pending addItemText: 'build project planner' due: DateAndTime yesterday assignees: {christoph}.
	pending addItemText: 'review literature' due: DateAndTime tomorrow assignees: {christoph}.
	pending addItemText: 'submit paper' due: DateAndTime tomorrow assignees: {christoph}.
	pending addItemText: 'practice piano' due: DateAndTime tomorrow assignees: {christoph}.
	pending addItemText: 'clean skimmer' due: DateAndTime tomorrow + 1 day assignees: {christoph}.
	pending addItemText: 'buy chocolate' due: DateAndTime tomorrow + 1 day assignees: {christoph}.
	^ board
	
	"what tasks are due tomorrow?"