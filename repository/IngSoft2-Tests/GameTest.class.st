Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test010WhenThePlayerThrowsItsShipMovesForward [

	| aGame aListOfNames aDie aGoalMark aShip |
	"aPlayerName := 'Pato'. DEPRECATED"
	aListOfNames := { 'Pato'. 'Mati' }.
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game createWith: aListOfNames and: aDie and: aGoalMark.

	aGame nextPlayerPlays.

	aShip := (aGame returnPlayerWithId: 1) ship.

	self assert: aShip position equals: 7
]

{ #category : 'tests' }
GameTest >> test011WhenThePlayersShipIsInTheGoalMarkOrGreaterThenItWins [

	| aGame aListOfNames aDie aGoalMark |
	"aPlayerName := 'Pato'. DEPRECATED"
	aListOfNames := { 'Pato'. 'Mati' }.
	aGoalMark := 7.
	aDie := LoadedDie createWith: 6.
	aGame := Game createWith: aListOfNames and: aDie and: aGoalMark.

	aGame nextPlayerPlays.

	self assert: (aGame isWinner: 'Pato')
]

{ #category : 'tests' }
GameTest >> test012WhenTheGameIsPlayedAFullRoundAllPlayersShipsMoved [

	| aGame aListOfNames aDie aGoalMark aShip anotherShip |
	aListOfNames := { 'Pato'. 'Mati' }.
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game createWith: aListOfNames and: aDie and: aGoalMark.

	aGame playFullRound.

	aShip := (aGame returnPlayerWithId: 1) ship.
	anotherShip := (aGame returnPlayerWithId: 2) ship.

	self assert: aShip position equals: 7.
	self assert: anotherShip position equals: 7
]

{ #category : 'tests' }
GameTest >> test013WhenTheGameIsPlayedUntilIsFinishedTheresAWinner [

	| aGame aListOfNames aDie aGoalMark |
	aListOfNames := { 'Pato'. 'Mati' }.
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game createWith: aListOfNames and: aDie and: aGoalMark.

	aGame playFullGame.

	self assert: (aGame isWinner: 'Pato')
]
