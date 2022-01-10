"
An AutoTypeErrorObjectTest is a test class for testing the behavior of AutoTypeErrorObject
"
Class {
	#name : #AutoTypeErrorObjectTest,
	#superclass : #TestCase,
	#category : #'AutoType-Tests-Dummies'
}

{ #category : #test }
AutoTypeErrorObjectTest >> testAsString [

	| errorObj errorMessage ex |
	errorMessage := 'there is an error. This is the message.'.
	errorObj := AutoTypeErrorObject newWithMessage: errorMessage.
	self assert: errorObj whatevermethod asString equals: errorMessage.
	self
		assert:
			errorObj whatevermethod another nested methods that dont exist
				asString
		equals: errorMessage.
	ex := nil.
	errorObj := [ 1 / 0 ] onErrorDo: [ :e | 
		            ex := e.
		            AutoTypeErrorObject newWithMessage: e asString ].
	self assert: ex isNotNil.
	self assert: ex asString equals: errorObj aNonExistingMethod asString
]
