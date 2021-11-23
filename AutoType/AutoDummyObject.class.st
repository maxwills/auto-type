"
Dummy class used to generate autoTypes, forcing their materialization.
"
Class {
	#name : #AutoDummyObject,
	#superclass : #Object,
	#category : #'AutoType-Dummy'
}

{ #category : #'reflective operations' }
AutoDummyObject >> asString [

	^ 'DummyState'
]

{ #category : #'reflective operations' }
AutoDummyObject >> doesNotUnderstand: aMessage [

	^ self
]
