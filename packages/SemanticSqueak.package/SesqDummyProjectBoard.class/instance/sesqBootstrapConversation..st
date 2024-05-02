SemanticSqueak
sesqBootstrapConversation: aConversation

	super sesqBootstrapConversation: aConversation.
	
	aConversation addSystemMessage: 'Note: The number of overall items in this board is pretty small. To filter items based on dynamic/semantic criteria, it is often best to just retrieve all items from a lane and decide manually which of them are relevant. For example, is there is no specific method selector available on DummyProjectItem that can be used to apply a filter, just return all items unfiltered in your code. For example, items do not have a category tag, so you would have to retrieve all items and find out by yourself that "picking fruits" or "maintaining trees" would qualify as "garden tasks".'.