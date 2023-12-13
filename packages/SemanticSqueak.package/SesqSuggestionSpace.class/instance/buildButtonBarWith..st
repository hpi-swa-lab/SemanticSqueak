toolbuilder
buildButtonBarWith: builder

	^ builder pluggablePanelSpec new
		layout: #horizontal;
		children:
			(OrderedCollection new
				add:
					(builder pluggableActionButtonSpec new
						label: '<';
						horizontalResizing: #shrinkWrap;
						model: self;
						action: #goBackward;
						enabled: #canGoBackward;
						yourself);
				add:
					(builder pluggableButtonSpec new
						label: '>';
						horizontalResizing: #shrinkWrap;
						model: self;
						action: #goForward;
						enabled: #canGoForward;
						state: #isAutoAdvancing;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						label: #editorLabel;
						name: #editor;
						model: self;
						action: #chooseEditor;
						changeLabelWhen: #editor;
						state: #isFollowingFocus;
						yourself);
				add:
					(builder pluggableButtonSpec new
						label: '...';
						horizontalResizing: #shrinkWrap;
						model: self;
						action: #offerMenu;
						yourself);
				yourself);
		yourself