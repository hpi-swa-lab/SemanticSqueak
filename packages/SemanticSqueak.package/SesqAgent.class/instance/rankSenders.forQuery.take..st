private
rankSenders: senders forQuery: queryOrNil take: anInteger

	| corpus |
	corpus := SesqMethodCorpus instance.
	corpus ifNil:
		[^ (senders semanticRandomSample: anInteger * 10) withoutDuplicates take: anInteger].
	^ corpus
		rankObjects: senders
		clusteredSampleForQuery: queryOrNil
		take: anInteger