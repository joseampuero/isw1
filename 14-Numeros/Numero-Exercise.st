!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'Ciro 4/17/2021 15:54:39'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'Ciro 4/17/2021 15:54:20'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:05:02'!
* aMultiplier 

	^aMultiplier multiplyWithEntero: self
		
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 15:59:08'!
+ anAdder 
	
	^anAdder sumWithEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:27:18'!
- aSubtrahend 

	^aSubtrahend restFromEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:14'!
/ aDivisor 
	
	^Fraccion with: self over: aDivisor! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 21:14:09'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:32:10'!
greatestCommonDivisorWith: aNumber

	^aNumber greatestCommonDivisorWithEntero: self! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:17:32'!
divideFromFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self)! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:31:43'!
greatestCommonDivisorWithEntero: aNumber

	^self class with: (value gcd: aNumber integerValue)! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:47'!
multiplyWithEntero: aMultiplier

	^self class with: value * aMultiplier integerValue
		
	
	! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:08'!
multiplyWithFraccion: aMultiplier

	^(self value * aMultiplier numerator) / aMultiplier denominator
	! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:19:07'!
restFromEntero: aMinuend

	^ self class with: aMinuend integerValue - value! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:26:12'!
restFromFraccion: aMinuend

	| newNumerator newDenominator |
	
	newNumerator := (aMinuend numerator - (aMinuend denominator * self)).
	newDenominator := aMinuend denominator.
	
	^newNumerator / newDenominator! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:42'!
sumWithEntero: anAdder

	^self class with: value + anAdder integerValue! !

!Entero methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:02:51'!
sumWithFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := anAdder numerator + (anAdder denominator * self).
	newDenominator := anAdder denominator * self.
	
	^newNumerator / newDenominator! !


!Entero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:49:13'!
isNegative
	
	^self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:31'!
isOne
	
	^self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:47:23'!
isZero
	
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'Ciro 4/19/2021 21:08:09'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [^Cero new initalizeWith: aValue].

	aValue = 1 ifTrue: [^Uno new initalizeWith: aValue]	.
	
	aValue > 1 ifTrue: [^EnteroMayorAUno new initalizeWith: aValue].
	
	^Negativo new initalizeWith: aValue.! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:49:25'!
isNegative
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:49'!
isOne
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:47:51'!
isZero
	
	^true! !


!Cero methodsFor: 'private' stamp: 'Ciro 4/21/2021 15:58:24'!
canDivide

	^self error: self class canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:11:47'!
executeBlockIfItIsCero: aBlock

	^aBlock value! !

!Cero methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:19'!
executeBlockIfItIsNegativo: aBlock

	^self! !

!Cero methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:57'!
executeBlockIfItIsUno: aBlock

	^self! !


!Cero methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 21:12:24'!
fibonacci

	^Entero with: 1! !


!classDefinition: #EnteroDistintoDeUnoYCero category: 'Numero-Exercise'!
Entero subclass: #EnteroDistintoDeUnoYCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroDistintoDeUnoYCero methodsFor: 'private' stamp: 'Ciro 4/21/2021 15:58:44'!
canDivide

	^self! !

!EnteroDistintoDeUnoYCero methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:11:41'!
executeBlockIfItIsCero: aBlock

	^self! !

!EnteroDistintoDeUnoYCero methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:51'!
executeBlockIfItIsUno: aBlock

	^self! !


!EnteroDistintoDeUnoYCero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:49:48'!
isNegative
	
	^self subclassResponsibility ! !

!EnteroDistintoDeUnoYCero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:54'!
isOne
	
	^false! !

!EnteroDistintoDeUnoYCero methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:05'!
isZero
	
	^false! !


!classDefinition: #EnteroMayorAUno category: 'Numero-Exercise'!
EnteroDistintoDeUnoYCero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroMayorAUno methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:13'!
executeBlockIfItIsNegativo: aBlock

	^self! !


!EnteroMayorAUno methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:50:17'!
isNegative
	
	^false! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
EnteroDistintoDeUnoYCero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:09'!
executeBlockIfItIsNegativo: aBlock

	^aBlock value! !


!Negativo methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:50:32'!
isNegative
	
	^true! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 21:13:14'!
fibonacci

	^self error: Entero negativeFibonacciErrorDescription! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:49:32'!
isNegative
	
	^false! !

!Uno methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:59'!
isOne
	
	^true! !

!Uno methodsFor: 'testing' stamp: 'Ciro 4/19/2021 20:48:12'!
isZero
	
	^false! !


!Uno methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 21:12:32'!
fibonacci

	^Entero with: 1! !


!Uno methodsFor: 'private' stamp: 'Ciro 4/21/2021 15:58:49'!
canDivide

	^self! !

!Uno methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:11:36'!
executeBlockIfItIsCero: aBlock

	^self! !

!Uno methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:06'!
executeBlockIfItIsNegativo: aBlock

	^self! !

!Uno methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:44'!
executeBlockIfItIsUno: aBlock

	^aBlock value! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:17:45'!
divideFromFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:34:01'!
greatestCommonDivisorWithEntero: aNumber

	^aNumber class with: (denominator integerValue gcd: aNumber integerValue)! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:04:51'!
multiplyWithEntero: aMultiplier

	^(numerator * aMultiplier) / denominator! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:31'!
multiplyWithFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/21/2021 15:36:02'!
restFromEntero: aMinuend

	| newNumerator newDenominator |

	newNumerator := (aMinuend * denominator) - numerator.
	newDenominator := denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:24:52'!
restFromFraccion: aMinuend

	| newNumerator newDenominator |

	newNumerator := (aMinuend numerator * denominator) - (aMinuend denominator * numerator).
	newDenominator := aMinuend denominator * denominator.
	
	^newNumerator / newDenominator
	
! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 15:59:27'!
sumWithEntero: anAdder

	| newNumerator newDenominator |
		
	newNumerator := numerator + (denominator * anAdder).
	newDenominator := denominator * anAdder.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'aux arithmetic operations' stamp: 'Ciro 4/19/2021 16:04:07'!
sumWithFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:25'!
* aMultiplier 

	^aMultiplier multiplyWithFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:07:23'!
+ anAdder 
	
	^ anAdder sumWithFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:25:36'!
- aSubtrahend 

	^ aSubtrahend restFromFraccion: self
	
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ciro 4/19/2021 16:17:54'!
/ aDivisor 

	^aDivisor divideFromFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ciro 4/17/2021 16:38:27'!
// aDivisor
	
	^self / aDivisor! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'Ciro 4/17/2021 16:24:33'!
isNegative
	
	^numerator integerValue < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private' stamp: 'Ciro 4/21/2021 15:58:53'!
canDivide

	^self! !

!Fraccion methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:11:26'!
executeBlockIfItIsCero: aBlock

	^self! !

!Fraccion methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:01'!
executeBlockIfItIsNegativo: aBlock

	^self! !

!Fraccion methodsFor: 'private' stamp: 'Ciro 4/21/2021 16:12:38'!
executeBlockIfItIsUno: aBlock

	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'Ciro 4/21/2021 16:10:57'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor canDivide.
	aDividend executeBlockIfItIsCero: [^aDividend].
	
	aDivisor executeBlockIfItIsNegativo: [ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator executeBlockIfItIsUno: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
