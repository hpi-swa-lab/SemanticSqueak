printing
printTextActionsOn: aStream

	self labeledActions associations
		do: [:assoc |
			aStream withAttribute: (PluggableTextAttribute evalBlock: (WeakMessageSend receiver: self selector: assoc value)) do:
				[aStream nextPutAll: ('[{1}]' format: {assoc key})]]
		separatedBy: [aStream space].