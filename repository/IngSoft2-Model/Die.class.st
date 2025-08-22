Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Die class >> createWith: aNumberOfFaces [

	^ self new initializeWith: aNumberOfFaces
]

{ #category : 'initialization' }
Die >> initializeWith: aNumberOfFaces [

	faces := aNumberOfFaces
]

{ #category : 'as yet unclassified' }
Die >> throw [

	^ (1 to: faces) atRandom
]
