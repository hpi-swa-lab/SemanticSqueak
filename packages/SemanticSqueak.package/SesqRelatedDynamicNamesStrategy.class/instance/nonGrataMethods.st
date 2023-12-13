accessing
nonGrataMethods

	^ {Object >> #doesNotUnderstand:.
	Object >> #mustBeBooleanIn:.
	Object lookupSelector: #flag:}
	
		collect: #methodReference