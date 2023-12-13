printing
printTextContentOn: aStream

	(self artifacts allSatisfy: [:artifact | artifact type = #method]) ifTrue:
		[^ self artifacts anyOne printTextContentOn: aStream].
	
	(self artifacts allSatisfy: [:artifact | #(method selector) includes: artifact type]) ifTrue:
		[(self artifacts detect: [:artifact | artifact type = #selector])
			printTextContentOn: aStream.
		self artifacts select: [:artifact | artifact type = #method] thenDo: [:methodArtifact |
			| methodText |
			methodText := Text streamContents: [:methodStream |
				methodArtifact printTextContentOn: methodStream].
			methodText lines withIndexDo: [:line :index |
				index = 2 ifTrue: [aStream space] ifFalse: [aStream cr; tab].
				aStream nextPutAll: line]].
		^ self].
	
	self artifacts
		do: [:artifact | artifact printTextContentOn: aStream]
		separatedBy: [aStream cr; nextPutAll: '---'; cr].