*SemanticSqueak-accessing
sesqPeekAt: aKey ifPresent: aBlock

	calls := calls + 1.
	^ map
		at: aKey
		ifPresent: [:node |
			hits := hits + 1.
			aBlock value: node value]