running
similarMethodsFor: originMethods

	^ (((originMethods gather: [:method |
		(method sesqSimilarSendingMethodsWithRanks take: 50) associations])
			orderedGroupBy: [:assoc | assoc key])
				associations
					collect: [:group | group key -> (group value collect: [:assoc | assoc value]) max]
					as: OrderedDictionary)
						withValuesSorted: #yourself descending