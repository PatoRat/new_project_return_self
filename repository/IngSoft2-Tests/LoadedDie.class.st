Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'throwResult'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
LoadedDie class >> createWith: aNumberToThrow [

	^ self new initializeWith: aNumberToThrow
]

{ #category : 'initialization' }
LoadedDie >> initializeWith: aNumberToThrow [

	throwResult := aNumberToThrow
]

{ #category : 'as yet unclassified' }
LoadedDie >> throw [

	^ throwResult
]
