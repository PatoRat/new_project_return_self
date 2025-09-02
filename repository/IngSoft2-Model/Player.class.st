"
A player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ship',
		'die',
		'id'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Player class >> createWith: aName and: anId and: aDie [

	self validate: aName.
	^ self new initializeWith: aName and: anId and: aDie
]

{ #category : 'validation' }
Player class >> validate: aName [

	aName isEmpty ifTrue: [
		Error signal: 'The Player should have a name.' ]
]

{ #category : 'accessing' }
Player >> id [

	^ id
]

{ #category : 'initialization' }
Player >> initializeWith: aName and: anId and: aDie [

	name := aName.
	ship := Ship createWith: anId.
	die := aDie.
	id := anId
]

{ #category : 'testing' }
Player >> isOver: aDistance [

	^ (ship positionLowerThan: aDistance) not
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

{ #category : 'checking' }
Player >> withId: anId [

	^ id = anId
]

{ #category : 'checking' }
Player >> withName: aName [

	^ name = aName
]
