object conversion
createAttributeDictionaryFor: anObject

	| dictionary |
	(self validateObject: anObject) ifFalse: [self notify: 'No valid object for creating an attribute dictionary for this model!'].
	dictionary := Dictionary new.
	self dataTypes keys do: [:each | | attrValue | 
			attrValue := anObject instVarNamed: each.
			(self foreignKeys includesKey: each) 
					ifTrue: [attrValue := attrValue asDict].
			dictionary at: each put: attrValue].
	^ dictionary
	