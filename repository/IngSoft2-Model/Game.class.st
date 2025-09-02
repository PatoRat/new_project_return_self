"
>>> Here I'll leave any notes or ideas for the future or for the structure, in other for other collaborators to read.

- In order to test a full round playing correctly, I must refactor the code to make game able to receive a list of players names. This refactor means the game is no longer played by 1 player.
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'goalMark',
		'players',
		'nextPlayerIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Game class >> createWith: aListOfNames and: aDie and: aGoalMark [

	| aPlayerList playerIndex |
	playerIndex := 0.
	self validate: aGoalMark.
	aPlayerList := aListOfNames asOrderedCollection collect: [ :aName |
		               playerIndex := playerIndex + 1.
		               Player createWith: aName and: playerIndex and: aDie ].
	^ self new
		  initializeWith: aPlayerList asOrderedCollection
		  and: aGoalMark
]

{ #category : 'validation' }
Game class >> validate: aGoalMark [

	aGoalMark < 4 ifTrue: [
		Error signal: 'The goal cant be nearer than 4 tiles.' ]
]

{ #category : 'initialization' }
Game >> initializeWith: aPlayerList and: aGoalMark [

	goalMark := aGoalMark.
	players := aPlayerList.
	nextPlayerIndex := 0
]

{ #category : 'testing' }
Game >> isWinner: aName [

	| playerToVerify |
	playerToVerify := players detect: [ :player | player withName: aName ].
	^ playerToVerify isOver: goalMark
]

{ #category : 'playing' }
Game >> nextPlayerPlays [
	
	| currentPlayer |
	self stillPlaying ifFalse: [ Error signal: 'The game finished.' ].
	
	currentPlayer := self playerInTurn.
	currentPlayer moveShipForward
]

{ #category : 'playing' }
Game >> playFullGame [
	self shouldBeImplemented.
]

{ #category : 'playing' }
Game >> playFullRound [
	self shouldBeImplemented.
]

{ #category : 'accessing' }
Game >> playerInTurn [

	nextPlayerIndex := nextPlayerIndex \\ players size + 1.
	^ players at: nextPlayerIndex
]

{ #category : 'accessing' }
Game >> returnPlayerWithId: anId [

	^ players
		  detect: [ :player | player withId: anId ]
		  ifNone: [ Error signal: 'There is no player with this ID.' ]
]

{ #category : 'checking' }
Game >> stillPlaying [

	| ships |
	ships := players collect: [ :player | player ship ].
	^ ships allSatisfy: [ :ship | ship positionLowerThan: goalMark ]
]
