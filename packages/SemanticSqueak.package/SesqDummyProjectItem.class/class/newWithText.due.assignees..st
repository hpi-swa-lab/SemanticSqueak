instance creation
newWithText: aString due: aDateAndTime assignees: assignees

	^ self new
		text: aString;
		dueDate: aDateAndTime;
		assignees: (OrderedCollection withAll: assignees);
		yourself