Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'playerId',
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
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

{ #category : 'initialization' }
Ship >> initializeWith: anId and: aPosition [

	playerId := anId.
	position := aPosition
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: aDistance [
	"Should I include a validation for the distance to be positive?"

	^ self class createWith: playerId and: position + aDistance
]

{ #category : 'accessing' }
Ship >> position [

	^ position
]
