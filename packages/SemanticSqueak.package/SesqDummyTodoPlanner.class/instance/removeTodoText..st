as yet unclassified
removeTodoText: aString

	todos remove: (todos detect: [:todo | todo text = aString]).