test - foreign keys
testJsonForForeignKeyObject

	| modelDict foreignKeyName jsonString testObjectDict |
	app database: RPPostgreSQLAdapter new;
			registerModel: RPTestModelFK;
			registerModel: RPTestModel. 

	RPTestHelper persistNew: 1 on: app.
	foreignKeyName := 'testmodelid'.
	jsonString := '{', ('"{1}":{2}' format: {foreignKeyName. 1}), '}'.
	app persistObjectBy: jsonString from: RPTestModelFK.  

	modelDict := (app database loadModelObject: 1 from: RPTestModelFK) asDict.
	testObjectDict := (modelDict at: #object).

	self assert: (modelDict includesKey: #object).
	self assert: (modelDict includesKey: #metadata).
	self assert: (testObjectDict isMemberOf: Dictionary).
	self assert: ((testObjectDict at: (foreignKeyName asSymbol)) includesKey: #object). 
	self assert: ((testObjectDict at: (foreignKeyName asSymbol)) includesKey: #metadata).
	
	

	