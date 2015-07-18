instance creation
method: aString rawUrl: anUrlString headers: aDictionary content: contentString

	aDictionary at: 'Content-Type' ifPresent: [:v | aDictionary at: 'content-type' put: v].

	^ self basicNew
		header: aDictionary;
		initialize;
		initStatusString: aString, ' ', anUrlString, ' HTTP/1.0';
		propertyAt: #rawPostFields put: (aString = 'POST'
			ifTrue: [contentString] ifFalse: ['']);
		propertyAt: #rawPutFields put: (aString = 'PUT'
			ifTrue: [contentString] ifFalse: ['']);
		yourself