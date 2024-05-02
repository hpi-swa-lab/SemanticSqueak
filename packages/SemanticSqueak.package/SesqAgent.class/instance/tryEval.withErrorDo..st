private
tryEval: aString withErrorDo: errorBlock

	^ self tryEval: aString withResultDo: [:result | ^ result] withErrorDo: errorBlock