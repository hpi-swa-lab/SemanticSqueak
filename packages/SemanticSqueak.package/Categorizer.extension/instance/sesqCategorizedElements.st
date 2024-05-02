*SemanticSqueak-Core-accessing
sesqCategorizedElements

	^ (1 to: categoryStops size)
		collect: [:categoryIndex |
			| firstIndex lastIndex |
			firstIndex := self firstIndexOfCategoryNumber: categoryIndex.
			lastIndex := self lastIndexOfCategoryNumber: categoryIndex.
			(categoryArray at: categoryIndex) ->
				(elementArray copyFrom: firstIndex to: lastIndex) sorted]
		as: OrderedDictionary