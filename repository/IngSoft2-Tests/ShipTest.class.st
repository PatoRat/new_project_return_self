Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> test005WhenTryingToCreateAShipWithAPositionLowerThan1ItRaisesError [

	TestUtils
		should: [ Ship createWith: 0 ]
		raiseWith: 'Position must be greater than 1.'
]

{ #category : 'tests' }
ShipTest >> test006WhenTellingTheShipToMoveForwardItChangesItsPosition [

	| aShip aDie |
	aDie := LoadedDie createWith: 6.
	aShip := Ship createWith: 1.
	aShip := aShip moveForward: aDie throw.
	self assert: (aShip isInPosition: 7)
]
