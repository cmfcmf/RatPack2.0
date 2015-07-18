object conversion
createAttributeDictionaryFor: anObject

	| dictionary |
	(self validateObject: anObject)ifFalse: [self notify: 'No valid object for creating a attribute dictionary for this model!'].
	dictionary := Dictionary new.
	self dataTypes keys do: [:each |
			dictionary at: each put: (anObject instVarNamed: each value)].

	^ dictionary 
	