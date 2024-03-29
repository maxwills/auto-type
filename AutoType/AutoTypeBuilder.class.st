Class {
	#name : #AutoTypeBuilder,
	#superclass : #Object,
	#instVars : [
		'type',
		'fields',
		'assignments',
		'autoType'
	],
	#classVars : [
		'counter'
	],
	#category : #'AutoType-Core'
}

{ #category : #initialization }
AutoTypeBuilder class >> initialize [

	counter := 0
]

{ #category : #'instance creation' }
AutoTypeBuilder class >> newFor: autoType [

	^ self new
		  autoType: autoType;
		  yourself
]

{ #category : #accessing }
AutoTypeBuilder >> autoType [

	^ autoType
]

{ #category : #accessing }
AutoTypeBuilder >> autoType: anObject [

	autoType := anObject
]

{ #category : #'as yet unclassified' }
AutoTypeBuilder >> buildClass [

	"this builds the class and return it"

	EpMonitor disableDuring: [ 
		| newClass |
		counter := counter + 1.
		newClass := (AutoTypeBase
		             << (#AutoTypeX , counter asString asSymbol))
			            slots: fields;
			            tag: '';
			            package: '';
			            build.

		fields do: [ :each | 
			self createAccessorsForField: each inClass: newClass ].
		newClass writeSlotNamed: #fields value: fields.
		newClass
			writeSlotNamed: #sortedFields
			value: (fields sorted: [ :a :b | a <= b ]).
		^ newClass ]
]

{ #category : #'as yet unclassified' }
AutoTypeBuilder >> createAccessorsForField: aSymbol inClass: aClass [

	"getter"

	aClass compile: aSymbol , ' 
	^ ' , aSymbol.
	"setter"
	aClass compile: aSymbol , ': anObject 
	' , aSymbol , ' := anObject'
]

{ #category : #'as yet unclassified' }
AutoTypeBuilder >> doPendingAssignmentsOn: anObject [

	assignments do: [ :each | 
		| selector arg |
		selector := each at: 1.
		arg := each at: 2.
		anObject perform: selector with: arg ].
	^ anObject
]

{ #category : #'reflective operations' }
AutoTypeBuilder >> doesNotUnderstand: aMessage [

	"Analyze the message. If it is a setter, remember the message and create the getter and setter. If it is a getter, just create the setter and getter"

	| selector |
	selector := aMessage selector.
	aMessage arguments size = 0
		ifTrue: [ fields add: selector ]
		ifFalse: [ 
			| field pendingAssignment |
			field := (selector copyFrom: 1 to: selector size - 1) asSymbol.
			pendingAssignment := { 
				                     selector.
				                     aMessage argument }.
			assignments add: pendingAssignment.
			fields add: field ]
]

{ #category : #'as yet unclassified' }
AutoTypeBuilder >> endWith [

	type := self buildClass.
	autoType type: type. "without this, the code would be always calling the builder, which is super slow"
	^ self doPendingAssignmentsOn: type new
]

{ #category : #initialization }
AutoTypeBuilder >> initialize [

	fields := OrderedCollection new.
	assignments := OrderedCollection new
]
