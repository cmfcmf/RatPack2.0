validation
validateObject: anObject

	| neededAttritbutes allAttributes |
	neededAttritbutes := self dataTypes keys asOrderedCollection copy.
	allAttributes := anObject class allInstVarNames. 
	
	^ allAttributes asSet includesAllOf: neededAttritbutes asSet 	