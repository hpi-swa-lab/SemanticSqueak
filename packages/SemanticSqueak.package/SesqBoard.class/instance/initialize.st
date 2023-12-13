initialize-release
initialize

	super initialize.
		
	artifacts := Set new.
	self strategies: self allStrategies.
	scheduledStrategies := Set new.
	pendingStrategies := OrderedCollection new.
	processes := WeakSet new.