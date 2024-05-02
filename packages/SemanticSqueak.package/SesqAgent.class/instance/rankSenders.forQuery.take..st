private
rankSenders: senders forQuery: queryOrNil take: anInteger

	^ SesqMethodCorpus instance
		rankObjects: senders
		clusteredSampleForQuery: queryOrNil
		take: anInteger