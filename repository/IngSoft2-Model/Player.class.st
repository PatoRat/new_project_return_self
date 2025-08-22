Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Player class >> createWith: aName and: anId [

	^ self new initializeWith: aName and: anId
]

{ #category : 'initialization' }
Player >> initializeWith: aName and: anId [

	name := aName.
	ship := Ship createWith: anId
]
