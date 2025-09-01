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
PlayerTest >> testWhenTryingToCreateAPlayerWithoutNameOrIdLowerThan1ItRaisesError [

	self
		should: [ Player createWith: '' and: 1 ]
		raiseWith: 'The Player should have a name.'.
		
	self should: [ Player createWith: 'Pato' and: 0 ] raiseWith: 'ID must be greater than 1.'
]
