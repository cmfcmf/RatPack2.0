test - REST operations
testGetModelInstance
 
	| url idUrl result testJson |
      app registerModel: RPTestModel.
      url := '/api/', (RPTestModel name).
	testJson := RPTestHelper getExampleJson.
      RPTestHelper post: url on: app content: testJson.
      idUrl := url, '/1'.
      result := RPTestHelper get: idUrl on: app.
      self assert:  ((result contents contents) includesSubString: testJson).
	self assert: result status equals: #ok.
	self assert: result contentType equals: 'application/json'.

      idUrl := url, '/2'.
      result := RPTestHelper get: idUrl on: app.
      self assert: app class objectNotFoundJson equals: (result contents contents).
	self assert: result status equals: #notFound.
	self assert: result contentType equals: 'application/json'. 
