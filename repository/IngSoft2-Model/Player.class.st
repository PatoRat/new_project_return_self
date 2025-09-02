"
A player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ship',
		'die'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Player class >> createWith: aName and: anId and: aDie [

	| aShip |
	self validate: aName.
	aShip := Ship createWith: anId.
	^ self new initializeWith: aName and: aShip and: aDie
]

{ #category : 'validation' }
Player class >> validate: aName [

	aName isEmpty ifTrue: [
		Error signal: 'The Player should have a name.' ]
]

{ #category : 'initialization' }
Player >> initializeWith: aName and: aShip and: aDie [

	name := aName.
	ship := aShip.
	die := aDie
]

{ #category : 'move' }
Player >> moveShipForward [
	ship := ship moveForward: die throw
]

{ #category : 'accessing' }
Player >> name [

	^ name
]

{ #category : 'accessing' }
Player >> ship [
	^ ship copy
]
