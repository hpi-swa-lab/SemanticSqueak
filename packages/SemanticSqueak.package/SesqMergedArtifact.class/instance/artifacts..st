accessing
artifacts: aCollection

	| originStrategies |
	artifacts := aCollection.
	
	originStrategies := self originStrategies.
	originStrategy := originStrategies size = 1 ifTrue: [originStrategies anyOne].