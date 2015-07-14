object handling
getObjectFromRequestAsHtml: aRPModelname with: anID

      | object aHtmlString aRPModelClass |
	aHtmlString := '<html><head></head><body><h3>Object-ID: ', anID, '</h3>'.
	aRPModelClass := self getRegisteredModel: aRPModelname.
	[object := self database loadObject: anID from: aRPModelClass] on: Warning do: [
		^ self objectNotFound].
       ^ self sendHtml: (aHtmlString, (aRPModelClass createHtmlTemplateFor: object), '</body></html>') with: 'model/html'