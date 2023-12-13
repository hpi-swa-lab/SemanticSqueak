running
populate

	self strategies
		select: [:strategy |
			self targetArtifactRoles anySatisfy: [:role |
				strategy canProduceArtifactRole: role]]
		thenDo: [:strategy |
			self schedule: strategy].