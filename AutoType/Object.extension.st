Extension { #name : #Object }

{ #category : #'*AutoType' }
Object >> slowIfTrue: aBlock ifFalse: aBlock2 [
"A fix to prevent a bug related to inlining and the Autotype implementation"
	^ self
		  ifTrue: aBlock
		  ifFalse: aBlock2
]
