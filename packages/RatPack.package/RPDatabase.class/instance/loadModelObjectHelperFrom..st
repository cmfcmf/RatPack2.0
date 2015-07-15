object handling
loadModelObjectHelperFrom: anRPModelClass 
	
	| objectDictionary objectDictionaries |
	objectDictionary := self modelDictionary at: (anRPModelClass name)
				ifAbsent: [self notify:  anRPModelClass name, ' not found!'].
	objectDictionaries := self resolveForeignKeysIn: objectDictionary  
								for: anRPModelClass.
	^ objectDictionaries collect:[ :each | 
			anRPModelClass constructModel: each]
	