test - foreign keys
testReconstructForeignKeyObject

	| modelObject |
	app database: RPPostgreSQLAdapter new;
			registerModel: RPTestModelFK;
			registerModel: RPTestModel. 
	RPTestHelper persistNew: 1 on: app.
	app persistObjectBy: '{"testmodelid":1}' from: RPTestModelFK.  
	modelObject := app database loadModelObject: 1 from: RPTestModelFK.

	self assert: modelObject class equals: RPTestModelFK.
	self assert: modelObject object class equals: RPTestClassFK.
	self assert: modelObject object testModelId class equals: RPTestModel.
	self assert: modelObject metadata notEmpty.
	self assert: modelObject object testModelId metadata notEmpty.