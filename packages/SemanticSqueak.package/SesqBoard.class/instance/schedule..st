running - private
schedule: aStrategy

	(scheduledStrategies ifAbsentAdd: aStrategy) ifFalse: [^ self].
	
	aStrategy requiredArtifactRoles ifNotEmpty: [:requiredRoles |
		| allProducingStrategies |
		allProducingStrategies := requiredRoles gather: [:role |
			| producingStrategies |
			producingStrategies := self strategies asArray select: [:ea |
				ea canProduceArtifactRole: role].
			(producingStrategies notEmpty or: [self allArtifacts anySatisfy: [:ea | ea artifactRole = role]]) ifFalse:
				[self error: ('cannot produce artifact role: {1}' format: {role})].
			producingStrategies].
		allProducingStrategies := allProducingStrategies withoutDuplicates.
		
		aStrategy requirements: allProducingStrategies.
		allProducingStrategies do: [:strategy |
			self schedule: strategy]].
	
	pendingStrategies add: aStrategy.
	
	self tick.