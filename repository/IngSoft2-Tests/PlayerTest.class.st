Class {
	#name : 'PlayerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
PlayerTest >> test007WhenTryingToCreateAPlayerWithoutNameOrIdLowerThan1ItRaisesError [

	TestUtils
		should: [ Player createWith: '' and: 1 ]
		raiseWith: 'The Player should have a name.'.

	TestUtils
		should: [ Player createWith: 'Pato' and: 0 ]
		raiseWith: 'ID must be greater than 1.'
]

{ #category : 'tests' }
PlayerTest >> test009WhenAPlayerThrowsADieTheShipMovesForwardTheAmountThrown [

	| aDie aPlayer |
	aDie := LoadedDie createWith: 6.
	aPlayer := Player createWith: 'Pato' and: 1.
	aPlayer moveShipForwardWith: aDie throw.
	self assert: (aPlayer isInPosition: 7)
]
