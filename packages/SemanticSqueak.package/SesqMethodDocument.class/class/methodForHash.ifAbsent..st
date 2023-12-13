acccessing method hashes
methodForHash: hash ifAbsent: absentBlock

	^ self hashedMethods
		at: hash ifAbsent: absentBlock