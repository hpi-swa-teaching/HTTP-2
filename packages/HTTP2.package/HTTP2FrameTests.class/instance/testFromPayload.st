testing
testFromPayload
	| header frame | 
	header := HTTP2Header newInContext: (HTTP2HPACKIndexTable newWith: 1000).
	header 
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: ':authority'->'www.example.com'.
	frame := HTTP2Frame fromPayload: header encode.
	frame asPING.
	frame streamIdentifier: 13.
	self assert: frame encode equals: #[16r0 16r0 16r14 16r06 16r0 16r0 16r0 16r0 16r0d	 16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d]
	