testDecondAndEncode
testDecodeAndEncodeInteger
	self assert: (H2HeaderField decodeInteger: (ReadStream on:
		(H2HeaderField new encodeInteger: 10 with: 5)) prefix:5) equals: 10. 
	self assert: (H2HeaderField decodeInteger: (ReadStream on: 
		(H2HeaderField new encodeInteger: 1025 with: 8)) prefix:8)  equals: 1025. 
	self assert: (H2HeaderField decodeInteger: (ReadStream  on:
		(H2HeaderField new encodeInteger: 0 with: 8)) prefix:8)  equals: 0. 
	self assert: (H2HeaderField decodeInteger: (ReadStream  on:
		(H2HeaderField new encodeInteger: 9000 with: 7)) prefix:7)  equals: 9000