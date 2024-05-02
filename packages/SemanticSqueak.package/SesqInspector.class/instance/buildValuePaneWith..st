toolbuilder
buildValuePaneWith: builder

	^ builder pluggablePanelSpec new
		model: self;
		children: #buildValuePaneWidgets;
		layout: #vertical;
		yourself