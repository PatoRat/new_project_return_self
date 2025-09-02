"
>>> Here I'll leave any notes or ideas for the future or for the structure, in other for other collaborators to read.
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'goalMark',
		'players'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Game class >> createWith: aName and: aDie and: aGoalMark [

	| aPlayer |
	self validate: aGoalMark.
	aPlayer := Player createWith: aName and: 1 and: aDie.
	^ self new initializeWith: aPlayer and: aGoalMark
]

{ #category : 'validation' }
Game class >> validate: aGoalMark [

	aGoalMark < 4 ifTrue: [
		Error signal: 'The goal cant be nearer than 4 tiles.' ]
]

{ #category : 'initialization' }
Game >> initializeWith: aPlayer and: aGoalMark [

	goalMark := aGoalMark.
	players := aPlayer asOrderedCollection
]

{ #category : 'playing' }
Game >> nextPlayerPlays [
	self shouldBeImplemented.
]
