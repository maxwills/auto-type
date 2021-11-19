"
An AutoTypeTest is a test class for testing the behavior of AutoType
"
Class {
	#name : #AutoTypeTest,
	#superclass : #TestCase,
	#category : #'AutoType-Tests'
}

{ #category : #test }
AutoTypeTest >> testAt [

	| baseCollection newCollection t |
	t := AutoType new.
	baseCollection := { 
		                  { 'john'. 'doe' }.
		                  { 'jane'. 'doe' } }.

	newCollection := baseCollection collect: [ :each | 
		                 t newWith
			                 firstName: (each at: 1);
			                 lastName: (each at: 2);
			                 fullName: (each at: 1) , ' ' , (each at: 2);
			                 endWith ].

	self assert: newCollection size equals: 2.

	self assert: (newCollection first at: #firstName) = 'john'.
	self assert: (newCollection first at: #lastName) = 'doe'.
	self assert: (newCollection first at: #fullName) = 'john doe'.

	self assert: (newCollection second at: #firstName) = 'jane'.
	self assert: (newCollection second at: #lastName) = 'doe'.
	self assert: (newCollection second at: #fullName) = 'jane doe'
]

{ #category : #test }
AutoTypeTest >> testAtPut [

	| baseCollection newCollection t |
	t := AutoType new.
	baseCollection := { 
		                  { 'john'. 'doe' }.
		                  { 'jane'. 'doe' } }.

	newCollection := baseCollection collect: [ :each | 
		                 t newWith
			                 firstName: (each at: 1);
			                 lastName: (each at: 2);
			                 fullName: (each at: 1) , ' ' , (each at: 2);
			                 endWith ].

	newCollection first at: #firstName put: 'notJohn'.
	newCollection second at: #fullName put: 'notAFullName'.
	self assert: newCollection first firstName equals: 'notJohn'.
	self assert: newCollection second fullName equals: 'notAFullName'
]

{ #category : #test }
AutoTypeTest >> testNoCollectionUsage [

	| baseCollection newCollection t |
	t := AutoType new.
	baseCollection := { 
		                  { 'john'. 'doe' }.
		                  { 'jane'. 'doe' } }.

	newCollection := baseCollection collect: [ :each | 
		                 t newWith
			                 firstName: (each at: 1);
			                 lastName: (each at: 2);
			                 fullName: (each at: 1) , ' ' , (each at: 2);
			                 endWith ].

	self assert: newCollection size equals: 2.
	
	self assert: newCollection first firstName = 'john'.
	self assert: newCollection first lastName = 'doe'.
	self assert: newCollection first fullName = 'john doe'.

	self assert: newCollection second firstName = 'jane'.
	self assert: newCollection second lastName = 'doe'.
	self assert: newCollection second fullName = 'jane doe'
]

{ #category : #test }
AutoTypeTest >> testNominal [

	| baseCollection newCollection t |
	t := AutoType new.
	baseCollection := { 
		                  { 'john'. 'doe' }.
		                  { 'jane'. 'doe' } }.

	newCollection := baseCollection collect: [ :each | 
		                 t newWith
			                 firstName: (each at: 1);
			                 lastName: (each at: 2);
			                 fullName: (each at: 1) , ' ' , (each at: 2);
			                 endWith ].

	self assert: newCollection size equals: 2.
	
	self assert: newCollection first firstName = 'john'.
	self assert: newCollection first lastName = 'doe'.
	self assert: newCollection first fullName = 'john doe'.

	self assert: newCollection second firstName = 'jane'.
	self assert: newCollection second lastName = 'doe'.
	self assert: newCollection second fullName = 'jane doe'
]
