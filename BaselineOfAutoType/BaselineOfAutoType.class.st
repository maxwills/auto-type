Class {
	#name : #BaselineOfAutoType,
	#superclass : #BaselineOf,
	#category : #BaselineOfAutoType
}

{ #category : #baselines }
BaselineOfAutoType >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'AutoType'.
		spec package: 'AutoType-Tests'  with: [ spec requires: #('AutoType') ] ]
]
