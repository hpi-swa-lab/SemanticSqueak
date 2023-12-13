accessing
type

	| types |
	types := artifacts collect: [:artifact | artifact type] as: Set.
	^ types size = 1 ifTrue: [types anyOne] ifFalse: [#merged]