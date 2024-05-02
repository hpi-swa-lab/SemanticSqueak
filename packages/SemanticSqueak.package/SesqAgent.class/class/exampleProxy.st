documentation
exampleProxy

	(SesqDummyTodoPlanner new
		addTodoText: 'buy apples' dueDate: DateAndTime tomorrow;
		addTodoText: 'clean up desk' dueDate: DateAndTime tomorrow + 2 day;
		addTodoText: 'pay bills' dueDate: DateAndTime yesterday;
		sesqProxy)
			textOfEarliestDueTodoItemAfter: DateAndTime today. "'''buy apples''' "