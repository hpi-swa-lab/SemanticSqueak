constants
maximumSourceSize

	"Chosen so that no relevant methods in the image are truncated but most data methods are caught. While there are still many shorter data methods, this truncation already eliminates ~13% of source characters in a regular image.
	Note that this truncated sources must not exceeed the embedding model's token window (1 character of Smalltalk sources averages to 0.26-0.3 tokens, but we have also encountered a few methods with 0.752 tokens/character). See also SesqMethodCorpus class>>#numbers."
	"^ 20000" "would cover even more relevant methods but would accept some too long methods due to variable token length"
	^ 10000

	"CurrentReadOnlySourceFiles cacheDuring:
		[self systemNavigation browseAllSelect: [:ea | ea getSource size > 11000]]."