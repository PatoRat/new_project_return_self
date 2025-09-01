Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ShipTest >> should: aCodeBlock raiseWith: anErrorMessage [

	self
		should: aCodeBlock
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
ShipTest >> testWhenTellingTheShipToMoveForwardItChangesItsPosition [

	| aShip aDie |
	aDie := LoadedDie createWith: 6.
	aShip := Ship createWith: 1.
	aShip := aShip moveForward: aDie throw.
	self assert: aShip position equals: 7
]

{ #category : 'tests' }
ShipTest >> testWhenTryingToCreateAShipWithAnIdLowerThan1ItRaisesError [

	self
		should: [ Ship createWith: 0 ]
		raiseWith: 'ID must be greater than 1.'
]
