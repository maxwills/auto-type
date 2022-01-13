Class {
	#name : #AutoTypeErrorObject,
	#superclass : #AutoTypeDummyObject,
	#instVars : [
		'errorMessage',
		'exception'
	],
	#category : #'AutoType-Dummies'
}

{ #category : #'instance creation' }
AutoTypeErrorObject class >> newFor: anException [

	Transcript
		show:
			anException asString , ' please inspect Query lastQuery errors.';
		cr.
	^ AutoTypeErrorObject new
		  errorMessage: anException;
		  exception: anException;
		  yourself
]

{ #category : #'instance creation' }
AutoTypeErrorObject class >> newFor: anException withExtraMessage: extraMessage [

	| message |
	message := ([ 
	            anException asString , ' ' , String cr join:
		            (anException signalContext stackOfSize: 8) ] onErrorDo: [ 
		            'Error creating description. ' ]) , '. ' , extraMessage.
	Transcript
		show: message;
		cr.
	^ AutoTypeErrorObject new
		  errorMessage: message;
		  exception: anException;
		  yourself
]

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

{ #category : #accessing }
AutoTypeErrorObject >> exception [

	^ exception
]

{ #category : #accessing }
AutoTypeErrorObject >> exception: anObject [

	exception := anObject
]

{ #category : #initialization }
AutoTypeErrorObject >> initialize [

	errorMessage := 'AutoTypeErrorObject'
]
