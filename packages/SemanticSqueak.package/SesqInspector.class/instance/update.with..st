toolbuilder
update: aspect with: anObject

	"To monkey-patch the behavior of the original model, we have installed ourselves as the model for the original model's views. Here, we need to forward all model updates from the original model to the views."
	self changed: aspect with: anObject.
	
	^ super update: aspect with: anObject