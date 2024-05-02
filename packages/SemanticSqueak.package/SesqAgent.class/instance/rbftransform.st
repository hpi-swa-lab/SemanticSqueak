private
rbftransform

	"Just for documentation. Findings: Does not work well. See PPTX notes for details.
	
	| query0 rbfTransform |
query0 := SesqMethodCorpus instance embeddingModel getEmbeddingFor: 'format a DateAndTime object as yyyy-mm-dd' config: SesqMethodCorpus instance embeddingConfig.
rbfTransform := [:alpha :beta |
	[:embedding :query | | d phi |
		d := embedding dot: query.
		phi := (beta negated * d ** 2) exp * alpha.
		embedding + (embedding - query * phi)]]
	value: 0.3 value: 0.
(((SesqMethodCorpus instance fromDocuments: (((self take: 100) collect: #sesqMethodDocument) collect: [:doc | doc shallowCopy embedding: (rbfTransform value: doc embedding value: query0)]) makeClusters: 5 maxIterations: 300)
	associations collect: [:centerAndDocs | centerAndDocs value detectMax: [:doc | doc embedding dot: centerAndDocs key]])
	collect: #method) browseMethods."