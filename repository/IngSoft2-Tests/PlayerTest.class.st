Class {
	#name : 'PlayerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
PlayerTest >> should: aCodeBlock raiseWith: anErrorMessage [

	self
		should: aCodeBlock
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
PlayerTest >> test007WhenTryingToCreateAPlayerWithoutNameOrIdLowerThan1ItRaisesError [

	self
		should: [ Player createWith: '' and: 1 and: (Die createWith: 6) ]
		raiseWith: 'The Player should have a name.'.

	self
		should: [ Player createWith: 'Pato' and: 0 and: (Die createWith: 6) ]
		raiseWith: 'ID must be greater than 1.'
]

{ #category : 'tests' }
PlayerTest >> test008APlayerShouldBeAbleToTellItsName [

	| aPlayer |
	aPlayer := Player createWith: 'Pato' and: 1 and: (Die createWith: 6).

	self assert: aPlayer name equals: 'Pato'
]

{ #category : 'tests' }
PlayerTest >> test009WhenAPlayerThrowsADieTheShipMovesForwardTheAmountThrown [

	| aShip aDie aPlayer |
	aDie := LoadedDie createWith: 6.
	aPlayer := Player createWith: 'Pato' and: 1 and: aDie.
	aPlayer moveShipForward.
	aShip := aPlayer ship.
	self assert: aShip position equals: 7
]
