Class {
	#name : #AutoTypeErrorObject,
	#superclass : #AutoTypeDummyObject,
	#instVars : [
		'errorMessage'
	],
	#category : #'AutoType-Dummies'
}

{ #category : #'instance creation' }
AutoTypeErrorObject class >> newWithMessage: string [

	Transcript
		show: string;
		cr.
	^ AutoTypeErrorObject new
		  errorMessage: string;
		  yourself
]

{ #category : #'reflective operations' }
AutoTypeErrorObject >> asString [

	^ errorMessage 
]

{ #category : #accessing }
AutoTypeErrorObject >> errorMessage [

	^ errorMessage
]

{ #category : #accessing }
AutoTypeErrorObject >> errorMessage: anObject [

	errorMessage := anObject
]

{ #category : #initialization }
AutoTypeErrorObject >> initialize [

	errorMessage := 'AutoTypeErrorObject'
]
