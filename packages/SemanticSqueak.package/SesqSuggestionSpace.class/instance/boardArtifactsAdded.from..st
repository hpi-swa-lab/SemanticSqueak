updating
boardArtifactsAdded: newArtifacts from: aBoard

	((newArtifacts
		select: [:artifact | self shouldShowArtifact: artifact])
			orderedGroupBy: [:artifact | self suggestionPaneFor: artifact artifactRole])
				keysAndValuesDo: [:pane :artifacts | pane basicAddArtifacts: artifacts from: aBoard].