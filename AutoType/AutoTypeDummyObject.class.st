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
