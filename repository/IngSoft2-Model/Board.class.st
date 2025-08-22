Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'tiles',
		'length'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> createWith: aLength [

	^ self new initializeWith: aLength
]

{ #category : 'creation' }
Board class >> createWith: aLength and: aListOfShips [

	^ self new initializeWith: aLength and: aListOfShips
]

{ #category : 'initialization' }
Board >> initializeWith: aLength [

	length := aLength.
	tiles := OrderedCollection new: aLength
]

{ #category : 'initialization' }
Board >> initializeWith: aLength and: aListOfShips [
	length := aLength .
	tiles := OrderedCollection new: aLength .
	"I'll continue later"
]

{ #category : 'as yet unclassified' }
Board >> move: aShip forward: aDistance [

	| modifiedShip newPosition |
	tiles removeAt: aShip position.
	modifiedShip := aShip moveForward: aDistance.
	newPosition := modifiedShip position min: length.
	tiles at: newPosition put: modifiedShip
]
