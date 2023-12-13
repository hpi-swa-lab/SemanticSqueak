private
basicAddArtifact: anArtifact

	artifactTexts at: anArtifact ifAbsentPut: anArtifact asStringOrText.
	artifacts add: anArtifact.
	
	self future artifactsChanged. "overhead per artifact is not large and it looks per fluent"