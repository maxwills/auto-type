# AutoType
Automatic anonymous classes generation.

## Baseline

Do this:
```Smalltalk
Metacello new
    baseline: 'AutoType';
    repository: 'github://maxwills/AutoType:main';
    load.
```

## General usage information

AutoType is a system that can be used to automatically generate a class from setter expressions. The new class is not installed in the system.

```Smalltalk
t := AutoType new.

item := t newWith
	firstName: (each at: 1);
	lastName: (each at: 2);
	fullName: (each at: 1) , ' ' , (each at: 2);
	endWith
```
Will create a new class with setters and getters for `#firstName`, `#lastName`, `#fullName`, and will return an instance of the class, ie., `item` responds to the the following messages: `item firstName`, `item firstName:`, `item lastName`, etc.

## How it works

The first time `newWith` is executed, it will crate a builder to define the class from the following setters received, until `endWith`, returning an instance of the new class with the assigned values. 

After the first time, it will directly create a new instance of the auto defined class.

## How to use

Dont put the `AutoType new` statement inside a block that is executed repeatedly.

***DONT DO THIS***

```Smalltalk
myCollection collect: [:each| 
	|t|
	t := AutoType new "bad usage!".
	t newWith
		firstName: (each at: 1);
		lastName: (each at: 2);
		fullName: (each at: 1) , ' ' , (each at: 2);
		endWith ]
```

Doing that will execute the definition logic on every iteration of the collect: method. Instead, use it like this:

***DO THIS INSTEAD***
```Smalltalk
|t|
t := AutoType new "placed instead in a scope out of the iteration".
	
myCollection collect: [:each| 
	t newWith
		firstName: (each at: 1);
		lastName: (each at: 2);
		fullName: (each at: 1) , ' ' , (each at: 2);
		endWith ]
```
This will execute the definition logic only during the first iteration, and then the new class is reused.

See `AutoTypeTest >> testNominal`.


To create more instances of the class, use the `newWith`/`endWith` cascade construct. Or you can also do:
`t class new`.
