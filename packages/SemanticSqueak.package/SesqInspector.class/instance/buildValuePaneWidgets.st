toolbuilder
buildValuePaneWidgets

	| builder spec |
	builder := ToolBuilder default.
	spec := self buildValuePaneWidgetWith: builder.
	^ {builder build: spec}