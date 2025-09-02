Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> testWhenThePlayerThrowsItsShipMovesForward [

	| aGame aPlayerName aDie aGoalMark |
	aPlayerName := 'Pato'.
	aGoalMark := 12.
	aDie := LoadedDie createWith: 6.
	aGame := Game createWith: aPlayerName and: aDie and: aGoalMark.
	
	aGame nextPlayerPlays.
]
