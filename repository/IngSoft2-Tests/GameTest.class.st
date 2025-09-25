Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#instVars : [
		'aPlayerListTemplate'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'queries - testing' }
GameTest >> playFullGameIn: aGame [

	[aGame stillPlaying ] whileTrue: [ aGame nextPlayerPlays ]
]

{ #category : 'queries - testing' }
GameTest >> playFullRoundIn: aGame and: anAmountOfPlayers [

	1 to: anAmountOfPlayers do: [ :turn | aGame nextPlayerPlays ]
]

{ #category : 'running' }
GameTest >> setUp [

	| aListOfNames |
	super setUp.

	aListOfNames := { 'Pato'. 'Mati' }.
	"To avoid repeated IDs"
	aPlayerListTemplate := (1 to: aListOfNames size) collect: [ :id |
		                       Player createWith: (aListOfNames at: id) and: id ]
]

{ #category : 'tests' }
GameTest >> test010WhenThePlayerThrowsItsShipMovesForward [

	| aGame aDie aGoalMark aPlayer |
	"aPlayerName := 'Pato'. DEPRECATED
	aListOfNames := { 'Pato'. 'Mati' }. DEPRECATED"
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game
		         createWith: aPlayerListTemplate
		         and: aDie
		         and: aGoalMark.

	aGame nextPlayerPlays.

	aPlayer := aPlayerListTemplate at: 1.

	self assert: (aGame player: aPlayer isInPosition: 7)
]

{ #category : 'tests' }
GameTest >> test011WhenThePlayersShipIsInTheGoalMarkOrGreaterThenItWins [

	| aGame aDie aGoalMark aPlayer |
	"aPlayerName := 'Pato'. DEPRECATED
	aListOfNames := { 'Pato'. 'Mati' }. DEPRECATED"
	aGoalMark := 7.
	aDie := LoadedDie createWith: 6.
	aGame := Game
		         createWith: aPlayerListTemplate
		         and: aDie
		         and: aGoalMark.

	aGame nextPlayerPlays.

	aPlayer := aPlayerListTemplate at: 1.

	self assert: (aGame isWinner: aPlayer)
]

{ #category : 'tests' }
GameTest >> test012WhenTheGameIsPlayedAFullRoundAllPlayersShipsMoved [

	| aGame aDie aGoalMark playerOne playerTwo|
	"aListOfNames := { 'Pato'. 'Mati' }. DEPRECATED"
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game
		         createWith: aPlayerListTemplate
		         and: aDie
		         and: aGoalMark.

	self playFullRoundIn: aGame and: aPlayerListTemplate size.

	"aShip := (aGame returnPlayerWithId: 1) ship.
	anotherShip := (aGame returnPlayerWithId: 2) ship. DEPRECATED"
	
	playerOne := aPlayerListTemplate at: 1.
	playerTwo := aPlayerListTemplate at: 2.

	self assert: (aGame player: playerOne isInPosition: 7).
	self assert: (aGame player: playerTwo isInPosition: 7)
]

{ #category : 'tests' }
GameTest >> test013WhenTheGameIsPlayedUntilIsFinishedTheresAWinner [

	| aGame aDie aGoalMark aPlayer |
	"aListOfNames := { 'Pato'. 'Mati' }. DEPRECATED"
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game
		         createWith: aPlayerListTemplate
		         and: aDie
		         and: aGoalMark.

	self playFullGameIn: aGame.

	aPlayer := aPlayerListTemplate at: 1.

	self assert: (aGame isWinner: aPlayer)
]

{ #category : 'tests' }
GameTest >> test014WhenTryingToAskPositionOfANotPlayingPersonItRaisesError [

	| aGame aDie aGoalMark aPlayer |
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game
		         createWith: aPlayerListTemplate
		         and: aDie
		         and: aGoalMark.

	aPlayer := Player createWith: 'Pato' and: 3.

	TestUtils
		should: [ aGame player: aPlayer isInPosition: 7 ]
		raiseWith: 'There is no player with ID: 3.'
]
