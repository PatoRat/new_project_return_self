"
Patri: Just a rule banned for the ""concatenation"" warning, since we are not focusing in code complexity

Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIngSoft2Model',
	#superclass : 'PackageManifest',
	#category : 'IngSoft2-Model-Manifest',
	#package : 'IngSoft2-Model',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestIngSoft2Model class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'IngSoft2-Model')) #'2025-09-12T16:34:33.307-03:00') )
]
