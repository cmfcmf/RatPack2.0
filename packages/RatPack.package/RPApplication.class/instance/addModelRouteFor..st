model handling
addModelRouteFor: aRPModelClass
"#(#get: #post: #put: #delete:)"

	| apiUrl htmlUrl wildcard |
	apiUrl := '/api/', (aRPModelClass name).
	htmlUrl := '/html/', (aRPModelClass name).
	wildcard := '/([^/]+)'.
	
	(self routesFor: #get:) add: ((apiUrl, wildcard) -> #'getObjectFromRequest:with:').
	(self routesFor: #get:) add: (apiUrl -> #'getModelFromRequest:').
	(self routesFor: #put:) add: (apiUrl -> #'putFromRequest:').
	(self routesFor: #delete:) add: ((apiUrl , wildcard) -> #'deleteFromRequest:with:').
	(self routesFor: #put:) add: ((apiUrl, wildcard) -> #'updateFromRequest:with:').

	(self routesFor: #get:) add: ((htmlUrl, wildcard) -> #'getObjectFromRequestAsHtml:with:').
	(self routesFor: #get:) add: (htmlUrl -> #'getModelFromRequestAsHtml:')