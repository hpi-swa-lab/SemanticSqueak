controlling
context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock

	self forHomeMethod: aContext homeMethod registerMethod: aCompiledMethod.
	
	^ super context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock