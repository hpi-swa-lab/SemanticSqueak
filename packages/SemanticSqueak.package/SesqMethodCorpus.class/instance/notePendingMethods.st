private
notePendingMethods
	"As method changes are often applied in bulks (i.e., when loading a new package), give any senders a chance to perform further changes before updating embeddings to minimize the number of requests to the model."

	hasPendingMethods := true.
	self flag: #forLater. "if necessary, run in background process as well"
	[self processPendingMethods] future
		in: [:block | block newProcess
			name: self name;
			priority: Processor systemBackgroundPriority;
			resume].