Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'id'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWith: anId [

	^ self new initializeWith: anId and: 0
]

{ #category : 'as yet unclassified' }
Ship class >> createWith: anId and: aPosition [

	^ self new initializeWith: anId and: aPosition
]

{ #category : 'comparing' }
Ship >> equals: aShip [

	^ id = aShip id
]

{ #category : 'accessing' }
Ship >> id [

	^ id
]

{ #category : 'initialization' }
Ship >> initializeWith: anId and: aPosition [

	id := anId.
	position := aPosition
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: aDistance [

	^ self class createWith: id and: position + aDistance
]

{ #category : 'accessing' }
Ship >> position [

	^ position
]
