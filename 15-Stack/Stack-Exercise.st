!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 4/22/2021 17:25:26'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	secondPushedObject := 'secondObject'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'ja 4/27/2021 16:54:03'!
assert: aStack keepSizeAndElementsOrderWith: otherStack

	self assert: aStack size equals: otherStack size.
	
	[aStack isEmpty not]	 whileTrue: [self assert: aStack pop equals: otherStack pop].

! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'ja 4/26/2021 18:56:20'!
emptyStack

	^ OOStack new.

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'ja 4/27/2021 15:54:18'!
stackWithAnElement

	^ OOStack new push: 'hola'.

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'ja 4/27/2021 16:08:13'!
stackWithManyElements

	| stack |
	
	stack _ OOStack new.
	
	stack push: 'hola'.
	stack push: 'como'.
	stack push: 'estas'.
	stack push: 'holala'.
	stack push: 'ho'.
	
	^ stack! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/27/2021 22:29:13'!
test01NoSetencesAreFoundInEmptyStack

	| stack finder sentencesToReturn |
	
	stack _ self emptyStack .
	
	sentencesToReturn _ OrderedCollection new.
	
	finder _ SentenceFinderByPrefix with: stack.
	
	self assert: (	finder find: 'h') equals: sentencesToReturn.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/27/2021 22:29:02'!
test02FoundASetenceInStackWithAnElement

	| stack finder sentencesToReturn |
	
	stack _ self stackWithAnElement .
	
	sentencesToReturn _ OrderedCollection with: 'hola'.
	
	finder _ SentenceFinderByPrefix with: stack.
	
	self assert: (	finder find: 'ho') equals: sentencesToReturn.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/27/2021 22:28:56'!
test03NotFoundASetenceInStackWithAnElement

	| stack finder sentencesToReturn |
	
	stack _ self stackWithAnElement .
	
	sentencesToReturn _ OrderedCollection new.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	self assert: (	finder find: 'a') equals: sentencesToReturn.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/27/2021 22:28:48'!
test04FoundSetencesInStackWithManyElements

	| stack finder sentencesToReturn |
	
	stack _ self stackWithManyElements.
	
	sentencesToReturn _ OrderedCollection with: 'ho' with: 'holala' with:'hola'.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	self assert: (	finder find: 'ho') equals: sentencesToReturn.
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/27/2021 16:12:43'!
test05PrefixCanNotBeEmpty

	| stack finder |
	
	stack _ self stackWithManyElements.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	self should: [finder find: ''] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: SentenceFinderByPrefix prefixCanNotBeEmptyErrorDescription]
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/29/2021 13:23:13'!
test06PrefixCanNotBeSpace

	| stack finder |
	
	stack _ self stackWithManyElements.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	self should: [finder find: ' '] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: SentenceFinderByPrefix prefixCanNotIncludeSpacesErrorDescription]
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/29/2021 13:23:21'!
test07PrefixCanNotIncludeSpaces

	| stack finder |
	
	stack _ self stackWithManyElements.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	self should: [finder find: 'a '] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: SentenceFinderByPrefix prefixCanNotIncludeSpacesErrorDescription]
	

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/29/2021 13:22:48'!
test08FinderIsCaseSensitive

	| stack finder sentencesToReturn |
	
	stack _ self stackWithManyElements.
	stack push: 'Ho'.
	stack push: 'Hola'.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	sentencesToReturn _ OrderedCollection with: 'Hola' with: 'Ho'.
	
	self assert: (finder find: 'Ho') equals: sentencesToReturn.

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ja 4/29/2021 13:22:55'!
test09FinderKeepTheOriginalStackAfterExecution

	| stack finder |
	
	stack _ self stackWithManyElements.
	
	finder _ SentenceFinderByPrefix with: stack .
	
	finder find: 'hola'.
	
	self assert: stack keepSizeAndElementsOrderWith: self stackWithManyElements.	

	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:27:50'!
size 

	^ top size! !

!OOStack methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:31:32'!
top 

	^ top value! !


!OOStack methodsFor: 'initialization' stamp: 'ja 4/25/2021 17:47:04'!
initialize 
	
	top _ Base from: self. ! !


!OOStack methodsFor: 'pop' stamp: 'ja 4/25/2021 17:31:07'!
pop
	
	| lastNode |
	
	lastNode _ self top.
	top _ top previous.
	
	^ lastNode ! !


!OOStack methodsFor: 'push' stamp: 'ja 4/27/2021 21:44:26'!
push: anElement

	top _ NextNode from: top with: anElement! !


!OOStack methodsFor: 'testing' stamp: 'ja 4/25/2021 17:20:08'!
isEmpty

	^ top isEmpty
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !


!classDefinition: #OOStackNode category: 'Stack-Exercise'!
Object subclass: #OOStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNode methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:28:00'!
size
	
	self subclassResponsibility ! !

!OOStackNode methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:32:39'!
value

	self subclassResponsibility ! !


!OOStackNode methodsFor: 'testing' stamp: 'ja 4/25/2021 17:20:51'!
isEmpty
	
	self subclassResponsibility ! !


!classDefinition: #Base category: 'Stack-Exercise'!
OOStackNode subclass: #Base
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:28:10'!
size 

	^ 0! !

!Base methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:50:08'!
value 

	self error: stack class stackEmptyErrorDescription .! !


!Base methodsFor: 'initialization' stamp: 'ja 4/25/2021 17:49:59'!
initializeFrom: anOOStack 

	stack _ anOOStack ! !


!Base methodsFor: 'testing' stamp: 'ja 4/25/2021 17:20:31'!
isEmpty
	
	^ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'Stack-Exercise'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'instance creation' stamp: 'ja 4/25/2021 17:49:39'!
from: anOOStack
	
	^ self new initializeFrom: anOOStack 
	! !


!classDefinition: #NextNode category: 'Stack-Exercise'!
OOStackNode subclass: #NextNode
	instanceVariableNames: 'previous value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NextNode methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:33:21'!
previous

	^ previous ! !

!NextNode methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:28:25'!
size 

	^ previous size + 1! !

!NextNode methodsFor: 'accessing' stamp: 'ja 4/25/2021 17:31:47'!
value 

	^ value! !


!NextNode methodsFor: 'initialization' stamp: 'ja 4/27/2021 21:44:06'!
initializeFrom: aPreviousStackNode with: anElement

	previous _ aPreviousStackNode.
	
	value _ anElement ! !


!NextNode methodsFor: 'testing' stamp: 'ja 4/25/2021 17:20:42'!
isEmpty
	
	^ false ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NextNode class' category: 'Stack-Exercise'!
NextNode class
	instanceVariableNames: ''!

!NextNode class methodsFor: 'instance creation' stamp: 'ja 4/25/2021 17:42:29'!
from: aPreviousStackNode with: anElement 

	^ self new initializeFrom: aPreviousStackNode with: anElement .! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack sentencesFound reverseStackSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'ja 4/26/2021 17:55:40'!
initializeWith: anOOStack 

	stack _ anOOStack .
	
	
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ja 4/26/2021 18:26:40'!
addToSentencesFoundIf: aSentence beginsWith: aPrefix

	(aSentence beginsWith: aPrefix) ifTrue: [ sentencesFound add: aSentence ]
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ja 4/27/2021 22:25:25'!
checkIfSentenceMatchesWith: aPrefix

	| top | 
	
	top _ stack pop.
	
	reverseStackSentences add: top.
	
	self addToSentencesFoundIf: top beginsWith: aPrefix .

	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ja 4/27/2021 22:26:14'!
findAllSentencesBeginingWith: aPrefix
	
	[ stack isEmpty not ] whileTrue: [ self checkIfSentenceMatchesWith: aPrefix ]

	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ja 4/27/2021 21:56:19'!
recoverStack
	
	reverseStackSentences reverseDo:[ :aSentence | stack push: aSentence ]
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ja 4/26/2021 18:15:08'!
startInternalStructures

	sentencesFound _ OrderedCollection new.

	reverseStackSentences _ OrderedCollection new.	
	
	! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'ja 4/27/2021 21:51:10'!
find: aPrefix
	
	self verifyNotEmptyAndNotIncludeSpaces: aPrefix.
	
	self startInternalStructures.
	
	self findAllSentencesBeginingWith: aPrefix.

	self recoverStack.

	^ sentencesFound 
	
	
	! !


!SentenceFinderByPrefix methodsFor: 'assertions' stamp: 'ja 4/27/2021 17:00:42'!
verifyNotEmptyAndNotIncludeSpaces: aPrefix

	aPrefix isEmpty ifTrue: [ self error: self class prefixCanNotBeEmptyErrorDescription ].
	
	(aPrefix includes: $ ) ifTrue: [self error: self class prefixCanNotIncludeSpacesErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'ja 4/27/2021 21:53:38'!
prefixCanNotBeEmptyErrorDescription

	^ 'Prefix can not be empty.'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'ja 4/27/2021 21:53:43'!
prefixCanNotIncludeSpacesErrorDescription

	^ 'Prefix can not include spaces.'! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'ja 4/26/2021 17:55:12'!
with: anOOStack 
	
	^ self new initializeWith: anOOStack ! !
