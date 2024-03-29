"
A class used as base for anonymous types. Does not produce change logs when compiling its methods.
A side effect of not producing logs this ways is that the source code is lost.
"
Class {
	#name : #AutoTypeBase,
	#superclass : #Object,
	#classInstVars : [
		'fields',
		'sortedFields'
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

{ #category : #'field definition' }
AutoTypeBase class >> sortedFields [

	^ sortedFields
]

{ #category : #comparing }
AutoTypeBase >> = arg1 [

	self == arg1 ifTrue: [ ^ true ].
	(arg1 isKindOf: AutoTypeBase) ifFalse: [ ^ false ].
	(self class sortedFields hasEqualElements: arg1 class sortedFields) 
		ifFalse: [ ^ false ].
	self keysDo: [ :arg2 | 
		(self at: arg2) = (arg1 at: arg2) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
AutoTypeBase >> at: arg1 [

	^ self perform: arg1
]

{ #category : #accessing }
AutoTypeBase >> at: arg1 put: arg2 [

	^ self perform: arg1 , ':' with: arg2
]

{ #category : #'as yet unclassified' }
AutoTypeBase >> endWith [

	
]

{ #category : #enumerating }
AutoTypeBase >> keysDo: arg1 [

	self class fields do: [ :arg2 | arg1 value: arg2 ]
]

{ #category : #printing }
AutoTypeBase >> printOn: arg1 [

	| tmp2 |
	tmp2 := true.
	self keysDo: [ :arg2 | 
		tmp2 ifFalse: [ arg1 nextPutAll: '; ' ].
		tmp2 := false.
		arg1
			nextPutAll: arg2;
			nextPutAll: ': '.
		(self at: arg2) printOn: arg1 ]
]
