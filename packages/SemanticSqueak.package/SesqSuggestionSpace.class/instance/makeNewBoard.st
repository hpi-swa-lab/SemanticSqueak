initialize-release
makeNewBoard

	^ SesqBoard new
		targetArtifactRoles: #(similarMethod relatedName);
		
		when: #artifactsAdded send: #boardArtifactsAdded:from: to: self;
		when: #completed send: #changed: to: self with: #isSearching;
		
		yourself