object handling
loadModelObjectsOf: anRPModelClass

	| response objectsAsDicts |
	response := self executeSQLStatement: ('SELECT * FROM ', (anRPModelClass tableName)).
	objectsAsDicts := self resolveForeignKeysIn: (self transformToCollection: response) for: anRPModelClass. 
	^ objectsAsDicts collect: [:each | (anRPModelClass constructModel: each)].