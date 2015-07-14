object handling
getRegisteredModelsFromRequest: aRPModelname
 
      | objectString aRPModelClass aHtmlString subString |
	aRPModelClass := self getRegisteredModel: aRPModelname.
	subString := ''.
	aHtmlString := '<b>Model:</b> ', (aRPModelClass), '<br><b>Json:</b> {"dataTypes":['.
		aRPModelClass dataTypes associations withIndexDo: [:each |
		subString := subString, '{"', (each key), '":"', (each value), '"'.
		subString := subString, '}'.].
	aHtmlString := aHtmlString, subString.
	aHtmlString := aHtmlString, ']}<br><br>'.
	
	objectString := '<b>Objects:</b>', (self getRegisteredObjectsFromRequestAsHtml: aRPModelname).
	^ self sendHtml: (aHtmlString, objectString) with: 'model/api'