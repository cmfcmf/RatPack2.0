metadata handling
metaDataVariables
"return self idColumnName asArray asOrderedCollection "

	| collection |
	collection := OrderedCollection  new.
	collection add: #id.

	^ collection 