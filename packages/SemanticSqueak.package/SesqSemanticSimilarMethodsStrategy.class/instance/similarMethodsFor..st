running
similarMethodsFor: originMethods

	^ SesqMethodCorpus instance
		findRankedObjects: self number
		similarToObjects: originMethods