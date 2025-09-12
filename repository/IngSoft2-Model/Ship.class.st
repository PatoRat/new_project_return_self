"
A ship
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'playerId',
		'position'
	],
	#category : 'IngSoft2-Model-Base',
	#package : 'IngSoft2-Model',
	#tag : 'Base'
}

{ #category : 'creation' }
Ship class >> createWith: anId [

	self validateId: anId.
	^ self new initializeWith: anId and: 1
]

{ #category : 'creation' }
Ship class >> createWith: anId and: aPosition [

	self validateId: anId.
	^ self new initializeWith: anId and: aPosition
]

{ #category : 'validation' }
Ship class >> validateId: anId [

	anId < 1 ifTrue: [ Error signal: 'ID must be greater than 1.' ]
]

{ #category : 'copying' }
Ship >> copy [

	^ self class createWith: playerId and: position
]

{ #category : 'initialization' }
Ship >> initializeWith: anId and: aPosition [

	playerId := anId.
	position := aPosition
]

{ #category : 'move' }
Ship >> moveForward: aDistance [
	"Should I include a validation for the distance to be positive?"

	^ self class createWith: playerId and: position + aDistance
]

{ #category : 'accessing' }
Ship >> position [

	^ position
]

{ #category : 'comparing' }
Ship >> positionLowerThan: aNumber [

	^ position < aNumber
]
