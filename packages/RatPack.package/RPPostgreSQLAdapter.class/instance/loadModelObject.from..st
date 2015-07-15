object handling
loadModelObject: anId from: anRPModelClass

	| response objectDictionaries |
	response := self executeSQLStatement: ('SELECT * FROM ', (anRPModelClass tableName), ' WHERE ', (anRPModelClass idColumnName),  '=', anId).
	objectDictionaries := self resolveForeignKeysIn: (self transformToCollection: response) for: anRPModelClass. 

	^ (objectDictionaries collect: [:each | anRPModelClass constructModel: each])
			ifEmpty: [self notify: 'Object not found!'];
			first 
	
	