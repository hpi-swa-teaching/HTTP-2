standard values
standardHeader 
	^ HTTP2Header new
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: ':authority'->'www.example.com';
		yourself 