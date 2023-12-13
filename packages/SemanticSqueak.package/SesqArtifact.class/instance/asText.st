printing
asText

	^ Text streamContents: [:stream |
		self printTextOn: stream]