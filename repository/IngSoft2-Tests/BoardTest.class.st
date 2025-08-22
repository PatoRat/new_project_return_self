Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testWhenThrowingDiceShipMovesInBoard [

	| aShip aDie aBoard |
	aShip := Ship createWith: 1.
	aDie := LoadedDie createWith: 4.
	aBoard := Board createWith: 10 and: aShip.
	
	self assert: false
]
