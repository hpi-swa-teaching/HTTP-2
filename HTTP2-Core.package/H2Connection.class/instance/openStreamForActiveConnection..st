requesting
openStreamForActiveConnection: aRequest
	| id http2stream |
	self canOpenNewStream ifFalse: [H2Error signal: 'Too many parallel requests'].
	
	id := self nextFreeStreamIdPostIncrement.
	http2stream := H2Stream new: id for: aRequest connection: self.
	self activeStreams at: id put: http2stream.
	^ http2stream promise