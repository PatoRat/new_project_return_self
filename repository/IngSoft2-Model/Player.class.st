"
A player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'ship',
		'id',
		'name'
	],
	#category : 'IngSoft2-Model-Base',
	#package : 'IngSoft2-Model',
	#tag : 'Base'
}

{ #category : 'creation' }
Player class >> createWith: aName and: anId [

	self validate: aName and: anId.
	^ self new initializeWith: aName and: anId
]

{ #category : 'validation' }
Player class >> validate: aName and: anId [

	aName isEmpty ifTrue: [
		Error signal: 'The Player should have a name.' ].

	anId < 1 ifTrue: [ Error signal: 'ID must be greater than 1.' ]
]

{ #category : 'comparing' }
Player >> equals: anotherPlayer [
	"This would be a complete comparison, but I'll go for another alternative since id is unique for every player
	^ id = anotherPlayer id and:
		  (name = anotherPlayer name and: (ship equals: anotherPlayer ship))"

	^ id = anotherPlayer id
]

{ #category : 'accessing' }
Player >> id [

	^ id
]

{ #category : 'initialization' }
Player >> initializeWith: aName and: anId [

	ship := Ship createWith: 1.
	id := anId.
	name := aName
]

{ #category : 'testing' }
Player >> isInPosition: aPosition [
^ ship isInPosition: aPosition
]

{ #category : 'testing' }
Player >> isOver: aDistance [

	^ (ship positionLowerThan: aDistance) not
]

{ #category : 'move' }
Player >> moveShipForwardWith: aDistance [
	ship := ship moveForward: aDistance
]
