*SemanticSqueak-accessing
sesqSelectedMethod

	^ ((self selectedClassOrMetaClass ifNil: [^ nil])
		compiledMethodAt: self selectedMessageName
		ifAbsent: [^ nil])
			methodReference