object conversion
createAttributeDictionaryFor: anObject withFKs: aBoolean

	| dictionary |
	(self validateObject: anObject) ifFalse: [self notify: 'No valid object for creating an attribute dictionary for this model!'].
	dictionary := Dictionary new.
	self dataTypes keys do: [:each | | attrValue | 
			attrValue := anObject instVarNamed: each.
			((self foreignKeys includesKey: each) & aBoolean) 
					ifTrue: [attrValue := attrValue asDict].
			dictionary at: each put: attrValue].
	^ dictionary
	