"
A system that can be used to automatically generate a class from setter expressions. This new class is not installed in the system. It also answers at: and at:put:, like a Dictionary.

t := AutoType new.

item := t newWith
			 firstName: (each at: 1);
			 lastName: (each at: 2);
			 fullName: (each at: 1) , ' ' , (each at: 2);
			 endWith
			
""Will create a new class with setters and getters for #firstName, #lastName, #fullName, and will return an instance of the class""

The first time newWith is executed, it will crate a builder to define the class from the following setters received, until endWith, returning an instance of the new class with the assigned values. 

After the first time, it will directly create a new instance of the auto defined class.

Dont put the 'AutoType new' statement inside a block that is executed repeatedly.

DONT DO THIS

myCollection collect: [:each| 
	|t|
	t := AutoType new ""bad usage!"".
	t newWith
			 firstName: (each at: 1);
			 lastName: (each at: 2);
			 fullName: (each at: 1) , ' ' , (each at: 2);
			 endWith
	]
Doing this will execute the definition logic on every iteration of the collect: method. Instead, use it like this:

|t|
t := AutoType new ""placed instead in a scope out of the iteration"".
	
myCollection collect: [:each| 
	t newWith
			 firstName: (each at: 1);
			 lastName: (each at: 2);
			 fullName: (each at: 1) , ' ' , (each at: 2);
			 endWith
	]
This will execute the definition logic only during the first iteration, and then the new class is reused.

See AutoTypeTest >> testNominal.


To create more instances of the class, use the newWith/endWith construct. Or you can also do:
t class new.
"
Class {
	#name : #AutoType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'AutoType-Core'
}

{ #category : #accessing }
AutoType >> newWith [

	"The first time this is executed, it will create a class builder that will beging listening for setters to define the type, until endWith is called, which will return an instance of the new defined class.
The second time and forth, it will immediately return a new instance of the already defined class (whose endWith method is equivalent to #yourself)
See AutoTypeBuild for more info.
Note: Why using #endWith instead of overriding #yourself? Ans: The #yourself method is generally expected to behave in a very specifc manner, and some code analyzing tools might rely on the standard objects API. Overriding these kind of methods is ill adviced.
"

	^ type ifNotNil: [ type new ] ifNil: [ AutoTypeBuilder newFor: self ]
]

{ #category : #accessing }
AutoType >> type [

	^ type
]

{ #category : #accessing }
AutoType >> type: anObject [

	type := anObject
]
