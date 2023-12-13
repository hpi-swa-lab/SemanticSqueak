accessing
addArtifacts: aCollection

	aCollection ifEmpty: [^ self].
	
	artifacts addAll: aCollection.
	
	self triggerEvent: #artifactsAdded withArguments: {aCollection. self}.
	
	self tick.