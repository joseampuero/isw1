!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:48:27'!
* aFactor

	^ aFactor! !

!I class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:46:15'!
+ aSummand

	^ aSummand next! !

!I class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:47:53'!
- aSubtrahend

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados .! !

!I class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:50:05'!
/ aDivisor

	^ aDivisor divideOne! !


!I class methodsFor: 'error description' stamp: 'ja 4/6/2021 19:03:39'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'error description' stamp: 'ja 4/6/2021 18:51:49'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'Numeros negativos no soportados'! !


!I class methodsFor: 'private' stamp: 'ja 4/7/2021 15:54:09'!
decreaseASubtrahendTimes: aValue

	^ aValue previous! !

!I class methodsFor: 'private' stamp: 'ja 4/7/2021 15:50:17'!
divideOne

	^ self! !

!I class methodsFor: 'private' stamp: 'ja 4/7/2021 16:05:18'!
next

	^ II! !

!I class methodsFor: 'private' stamp: 'ja 4/7/2021 16:05:10'!
previous

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados .! !


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 16:01:54'!
* aFactor

	^ self multiplySelfTimes: aFactor + aFactor! !

!II class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:46:23'!
+ aSummand

	^ self previous + aSummand next! !

!II class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:53:36'!
- aSubtrahend

	^ aSubtrahend decreaseASubtrahendTimes: self! !

!II class methodsFor: 'arithmetic operations' stamp: 'ja 4/7/2021 15:49:04'!
/ aDivisor

	self < aDivisor 
		ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor] 
		ifFalse: [ self = aDivisor 
					ifTrue: [ ^I ] 
					ifFalse: [ ^ ((self - aDivisor) / aDivisor) next ] ]
	! !


!II class methodsFor: 'comparison' stamp: 'ja 4/6/2021 18:42:34'!
< aValue

	^ aValue parents includes: self .! !


!II class methodsFor: 'error description' stamp: 'ja 4/7/2021 16:03:45'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero mayor'! !


!II class methodsFor: 'private' stamp: 'ja 4/7/2021 15:54:34'!
decreaseASubtrahendTimes: aValue

	^ aValue previous - self previous! !

!II class methodsFor: 'private' stamp: 'ja 4/7/2021 15:50:17'!
divideOne

	^ self error: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor .! !

!II class methodsFor: 'private' stamp: 'ja 4/7/2021 16:02:30'!
multiplySelfTimes: aValue

	^ self previous * aValue! !

!II class methodsFor: 'private' stamp: 'ARM 4/5/2021 21:07:59'!
next

	next ifNil:[
		next _ self createChildNamed: self name, 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'private' stamp: 'ja 4/6/2021 19:09:28'!
previous

	^ previous! !

!II class methodsFor: 'private' stamp: 'ja 4/7/2021 16:04:20'!
previous: aValue

	previous _ aValue ! !


!II class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Numeros Naturales'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Numeros Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Numeros Naturales'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Numeros Naturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: 'Numeros Naturales'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Numeros Naturales'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Numeros Naturales'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Numeros Naturales'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'ja 4/7/2021 16:13:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!