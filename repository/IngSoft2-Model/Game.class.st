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
		'nextPlayerIndex'
	],
	#category : 'IngSoft2-Model-Base',
	#package : 'IngSoft2-Model',
	#tag : 'Base'
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

{ #category : 'accessing' }
Game >> getNextPlayer [

	nextPlayerIndex := nextPlayerIndex \\ players size + 1.
	^ players at: nextPlayerIndex
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
	
	currentPlayer := self getNextPlayer.
	currentPlayer moveShipForward
]

{ #category : 'playing' }
Game >> playFullGame [

	[ self stillPlaying ] whileTrue: [ self nextPlayerPlays ]
]

{ #category : 'playing' }
Game >> playFullRound [

	[ self stillPlaying and: nextPlayerIndex < players size ] whileTrue: [
		self nextPlayerPlays ]
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

	| ships |
	ships := players collect: [ :player | player ship ].
	^ ships allSatisfy: [ :ship | ship positionLowerThan: goalMark ]
]
