object conversion
createJsonFor: anObject

	^ (self createAttributeDictionaryWithFKsFor: anObject) asJsonString
