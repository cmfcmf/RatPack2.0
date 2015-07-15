object handling
loadModelObject: anId from: aRPModelClass
	
	| dictionary objectDictionary |	
	objectDictionary := self modelDictionary at: (aRPModelClass name)
				ifAbsent: [self notify:  aRPModelClass name, ' not found!'].
	dictionary := objectDictionary at: (anId asString asSymbol) ifAbsent: [self notify: 'Object not found!']. 
	^ aRPModelClass constructModel: dictionary
	