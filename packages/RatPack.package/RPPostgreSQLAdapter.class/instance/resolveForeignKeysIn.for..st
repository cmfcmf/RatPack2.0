object handling
resolveForeignKeysIn: objectDictionaries for: anRPModelClass
	
	| foreignKeys |
	foreignKeys := anRPModelClass foreignKeys.
	objectDictionaries do: [:objectDict | 
				objectDict associationsDo: [:assoc | (foreignKeys includesKey: assoc key)
					ifTrue: [objectDict at: assoc key put:
								(self loadModelObject: assoc value 
									  from: (foreignKeys at: assoc key))] ]].
	^ objectDictionaries