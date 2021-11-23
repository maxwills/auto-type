"
A class used as base for anonymous types. Does not produce change logs when compiling its methods.
"
Class {
	#name : #AutoTypeBase,
	#superclass : #Object,
	#classVars : [
		'fields'
	],
	#category : #'AutoType-Core'
}

{ #category : #testing }
AutoTypeBase class >> acceptsLoggingOfCompilation [
"prevents logging of methods compilation for this class"
	^ false
]

{ #category : #'field definition' }
AutoTypeBase class >> fields [

	^ fields
]

{ #category : #accessing }
AutoTypeBase >> at: arg1 [

	^ self perform: arg1
]

{ #category : #accessing }
AutoTypeBase >> at: arg1 put: arg2 [

	^ self perform: arg1 with: arg2
]

{ #category : #'as yet unclassified' }
AutoTypeBase >> endWith [

	
]

{ #category : #enumerating }
AutoTypeBase >> keysDo: arg1 [

	fields do: [ :arg2 | arg1 value: arg2 ]
]
