initialize-release
subscribeToSystemChanges

	self unsubscribeFromSystemChanges.
	SystemChangeNotifier uniqueInstance
		notify: self
		ofAllSystemChangesUsing: #systemEvent:.