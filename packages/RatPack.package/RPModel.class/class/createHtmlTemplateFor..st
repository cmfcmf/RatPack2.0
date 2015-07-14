object conversion
createHtmlTemplateFor: anObject

	| aHtmlString |
	(self validateObject: anObject) ifFalse: [self notify: 'No valid object!'].
	aHtmlString := '<table>'.
	self dataTypes keys do: [:each |
			aHtmlString := aHtmlString, '<tr><td>', each, '</td><td>', (anObject instVarNamed: each value), '</td></tr>'].
	^ (aHtmlString, '</table>')