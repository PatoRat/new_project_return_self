Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'players',
		'die'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createWith: aListOfPlayers and: aDie [

	^ self new initializeWith: aListOfPlayers and: aDie
]

{ #category : 'initialization' }
Game >> initializeWith: aListOfPlayers and: aDie [

	players := aListOfPlayers.
	die := aDie
]
