"
A ship
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model-Base',
	#package : 'IngSoft2-Model',
	#tag : 'Base'
}

{ #category : 'creation' }
Ship class >> createWith: aPosition [

	self validatePosition: aPosition.
	^ self new initializeWith: aPosition
]

{ #category : 'validation' }
Ship class >> validatePosition: aPosition [

	aPosition < 1 ifTrue: [
		Error signal: 'Position must be greater than 1.' ]
]

{ #category : 'copying' }
Ship >> copy [

	^ self class createWith: position
]

{ #category : 'initialization' }
Ship >> initializeWith: aPosition [

	position := aPosition
]

{ #category : 'accessing' }
Ship >> isInPosition: aPosition [

	^ position = aPosition
]

{ #category : 'move' }
Ship >> moveForward: aDistance [
	"Should I include a validation for the distance to be positive?"

	^ self class createWith: position + aDistance
]

{ #category : 'comparing' }
Ship >> positionLowerThan: aNumber [

	^ position < aNumber
]
