"
Dummy class used to generate autoTypes, forcing their materialization.
"
Class {
	#name : #AutoTypeDummyObject,
	#superclass : #Object,
	#category : #'AutoType-Dummies'
}

{ #category : #controlling }
AutoTypeDummyObject >> and: anObject [
^self
]

{ #category : #'reflective operations' }
AutoTypeDummyObject >> asString [

	^ 'DummyObject'
]

{ #category : #'reflective operations' }
AutoTypeDummyObject >> doesNotUnderstand: aMessage [

	^ self
]

{ #category : #'as yet unclassified' }
AutoTypeDummyObject >> forceTrueOrFalse [
	"Used to ensure boolean values in AutoType expressions. This must be used if you use #ifTrue: and similar messages in a Autotype setter expression. 
	This returns randomly true or false, to prevent infinite loops if used in whileTrue or whilefalse expressions.
"

	^ (SharedRandom globalGenerator nextInteger: 2) = 1
]

{ #category : #controlling }
AutoTypeDummyObject >> iFalse: aBlock [

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> ifFalse: aBlock2 ifTrue: aBlock [ 

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> ifTrue: aBlock [

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> ifTrue: aBlock ifFalse: aBlock2 [

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> isEmpty [

	^ true
]

{ #category : #controlling }
AutoTypeDummyObject >> isNotEmpty [

	^ true
]

{ #category : #controlling }
AutoTypeDummyObject >> or: anObject [

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> whileFalse: aBlock [

	^ self
]

{ #category : #controlling }
AutoTypeDummyObject >> whileTrue: aBlock [

	^ self
]
