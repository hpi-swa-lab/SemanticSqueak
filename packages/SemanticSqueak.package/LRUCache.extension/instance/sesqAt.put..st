*SemanticSqueak-accessing
sesqAt: key put: value

	^ map
		at: key
		ifPresent: [:node |
			node value: value.
			value]
		ifAbsent:
			[| node |
			map size = size
				ifTrue:
					[node := head previous.
					node unlink.
					map removeKey: node key]
				ifFalse:
					[node := LRUCacheNode new].
			node linkAfter: head.
			map at: key put: node.
			node 
				key: key;
				value: value;
				value]