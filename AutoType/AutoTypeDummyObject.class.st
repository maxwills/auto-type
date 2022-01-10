"
Dummy class used to generate autoTypes, forcing their materialization.
"
Class {
	#name : #AutoTypeDummyObject,
	#superclass : #Object,
	#category : #'AutoType-Dummies'
}

{ #category : #'reflective operations' }
AutoTypeDummyObject >> asString [

	^ 'DummyObject'
]

{ #category : #'reflective operations' }
AutoTypeDummyObject >> doesNotUnderstand: aMessage [

	^ self
]
