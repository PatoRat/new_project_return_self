"
>>> Here I'll leave any notes or ideas for the future or for the structure, in other for other collaborators to read.

- In order to test a full round playing correctly, I must refactor the code to make game able to receive a list of players names. This refactor means the game is no longer played by 1 player.
>>> FIRST SPRINT ORDERED BY MY BROTHER IS FINISHED <<<
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'goalMark',
		'players',
		'nextPlayerIndex',
		'die'
	],
	#category : 'IngSoft2-Model-Base',
	#package : 'IngSoft2-Model',
	#tag : 'Base'
}

{ #category : 'creation' }
Game class >> createWith: aPlayerList and: aDie and: aGoalMark [

	| playerIndex |
	playerIndex := 0.
	self validate: aGoalMark.
	^ self new
		  initializeWith: aPlayerList asOrderedCollection deepCopy
		  and: aDie
		  and: aGoalMark
]

{ #category : 'validation' }
Game class >> validate: aGoalMark [

	aGoalMark < 4 ifTrue: [
		Error signal: 'The goal cant be nearer than 4 tiles.' ]
]

{ #category : 'initialization' }
Game >> initializeWith: aPlayerList and: aDie and: aGoalMark [

	die := aDie.
	goalMark := aGoalMark.
	players := aPlayerList.
	nextPlayerIndex := 0
]

{ #category : 'testing' }
Game >> isWinner: aPlayer [

	| playerToVerify |
	playerToVerify := players detect: [ :player | player equals: aPlayer ].
	^ playerToVerify isOver: goalMark
]

{ #category : 'playing' }
Game >> nextPlayerPlays [

	| currentPlayer |
	self stillPlaying ifFalse: [  ].

	nextPlayerIndex := nextPlayerIndex \\ players size + 1.
	currentPlayer := players at: nextPlayerIndex.
	currentPlayer moveShipForwardWith: die throw
]

{ #category : 'accessing' }
Game >> player: aPlayer isInPosition: aPosition [


	| detectedPlayer |
	detectedPlayer:= players
		  detect: [ :player | player equals: aPlayer ]
		  ifNone: [
		  Error signal: 'There is no player with ID: ' , aPlayer id asString, '.' ].
	^ detectedPlayer isInPosition: aPosition
]

{ #category : 'accessing' }
Game >> returnPlayerWithId: anId [

	^ players
		  detect: [ :player | player hasId: anId ]
		  ifNone: [
		  Error signal: 'There is no player with ID: ' , anId asString, '.' ]
]

{ #category : 'checking' }
Game >> stillPlaying [

	^ players allSatisfy: [ :player | (player isOver: goalMark) not ]
]
