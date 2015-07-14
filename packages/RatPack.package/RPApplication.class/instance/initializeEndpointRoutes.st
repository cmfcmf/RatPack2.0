initialize-release
initializeEndpointRoutes

	| apiUrl htmlUrl |
	apiUrl := '/api'.
	(self routesFor: #get:) add: (apiUrl -> #'getAllModels').

	htmlUrl := '/html'.
	(self routesFor: #get:) add: (htmlUrl -> #'getAllModelsFromRequestAsHtml').
	