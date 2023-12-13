private
resetArtifacts

	artifacts removeAll.
	artifactTexts removeAll.
	
	self future artifactsChanged.