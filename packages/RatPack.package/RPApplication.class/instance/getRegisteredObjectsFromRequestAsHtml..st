object handling
getRegisteredObjectsFromRequestAsHtml: aRPModelname
 
      | objectString objects |
	objectString := ''.
      objects := self database loadObjects: (self getRegisteredModel: aRPModelname).
      ^ (objects collect: [:each |
               '<br>ID: <a href="/html/', (aRPModelname), '/', (each metadata at: #isd), '">',  (each metadata at: #id), '</a>']) join
