test - foreign keys
testGetForeignKeys

	self assert: (RPTestModelFK foreignKeys at: #testmodelid) equals: RPTestModel 