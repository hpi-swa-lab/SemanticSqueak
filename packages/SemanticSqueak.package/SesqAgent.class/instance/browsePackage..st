functions
browsePackage: packageName
	"get all classes in the package"
	<function: browsePackage(packageName: string)>

	| package |
	package := self environment packageOrganizer
		packageNamed: packageName
		ifAbsent: [self error: 'unknown package'].
	
	^ OrderedJsonObject new
		packageName: package name;
		classHierarchy:
			(String streamContents: [:stream |
				(package classes groupBy: #category) withKeysSorted
					associations
						do: [:categoryAndClasses |
							stream
								nextPut: $";
								nextPutAll: categoryAndClasses key;
								nextPut: $";
								cr.
							(Browser new
								selectSystemCategory: categoryAndClasses key;
								hierarchicalClassList)
									do: [:line |
										stream
											nextPutAll: line;
											cr]]
									separatedBy: [stream cr]]) withUnixLineEndings;
		yourself