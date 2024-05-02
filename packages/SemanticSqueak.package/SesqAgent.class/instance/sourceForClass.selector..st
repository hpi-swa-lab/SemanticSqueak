private
sourceForClass: aClass selector: selector

	| source |
	source := (aClass sourceCodeAt: selector ifAbsent: [self error: ('Class {1} has no method {2}' format: {aClass name. selector printString})])
		truncateWithEllipsisTo: 6000.
	^ aClass name , '>>' , source asString withUnixLineEndings