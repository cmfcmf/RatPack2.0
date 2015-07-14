model handling
getAllModelsFromRequestAsHtml
	
	 ^ self sendHtml: ('<!DOCTYPE html><html><head></head><body><h3>Models:</h3>', 
			((self modelClasses asOrderedCollection collect: [:each | each structureAsHtmlAt]) join),   
			'</body></html>') asString with: 'html'
