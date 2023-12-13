*SemanticSqueak-private
sesqInitializeMessageList: anArray
	"Initialize my messageList from the given ORDERED list of MethodReference or string objects.  NB: special handling for uniclasses.
	 Do /not/ replace the elements of anArray if they are already MethodReferences, so as to allow users to construct richer systems, such as differencers between existing and edited versions of code.
	NOTE THAT we must support anArray to already have the desired amount and order of elements such as for the 'method inheritance' view, where all elements are prefixed with spaces to indicate the inheritance tree."
	
	messageList := OrderedCollection new.
	anArray do:
		[:each |
		each isCodeReference
			ifTrue: [messageList add: each]
			ifFalse:
				[ MessageSet
					parse: each 
					toClassAndSelector:
						[ : class : sel | class ifNotNil: [ messageList add: (MethodReference class: class selector: sel) ] ] ] ].
	"Unify labels if wanted."
	self class useUnifiedMessageLabels ifTrue:
		[ messageList withIndexDo: 
			[ : each : index | 
			each stringVersion: (self indentionPrefixOfSize: (self indentionsIn: each stringVersion)) , (self unifiedMessageLabelFor: each) ] ].
	messageListIndex := messageList isEmpty ifTrue: [0] ifFalse: [1].
	contents := String empty