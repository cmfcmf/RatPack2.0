routes
handleRequestForSimpleJSON
"Change if objects are finished! Change test too!"

	<get: '/simpleJSON'>	
	| tmp |
	tmp := '{"Name":"Test","Port":"1111","Users":["me","you"],"Text":{"Header":"testheader", "Content":"blabla"},"value":30,"finished":true}'.

	^ self sendJson: tmp with: '/simpleJSON'