Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DieTest >> should: aCodeBlock raiseWith: anErrorMessage [

	self
		should: aCodeBlock
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
DieTest >> test001WhenThrowingADieItReturnsARandomNumberBetween1AndTheGreaterFace [

	| aDie |
	aDie := Die createWith: 6.
	self assert: (aDie throw between: 1 and: 6)
]

{ #category : 'tests' }
DieTest >> test002WhenTryingToCreateADieWithFacesLowerThan4ItRaisesAnError [

	self
		should: [ Die createWith: -2 ]
		raiseWith: 'Minimum amount of faces should be 4.'
]

{ #category : 'tests' }
DieTest >> test003WhenThrowingALoeadedDieItReturnsTheIndicatedNumber [

	| aDie |
	aDie := LoadedDie createWith: 4.
	self assert: aDie throw equals: 4
]

{ #category : 'tests' }
DieTest >> test004WhenTryingToCreateALoadedDieWithAThrowLowerThan1ItRaisesAnError [

	self
		should: [ LoadedDie createWith: 0 ]
		raiseWith: 'The die cannot throw a number lower than 1.'
]
