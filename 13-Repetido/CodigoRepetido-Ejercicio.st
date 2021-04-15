!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self assertDo: [customerBook addCustomerNamed: 'John Lennon'] takeLessTimeThat: 50 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assertDo: [customerBook removeCustomerNamed: paulMcCartney] takeLessTimeThat: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test03CanNotAddACustomerWithEmptyName 

	self do:[ customerBook addCustomerNamed: '']
		throw: Error 
		asserting: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self do:[ customerBook removeCustomerNamed: 'Paul McCartney' ]
		throw: NotFound 
		asserting: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertTotalCustomersAndActiveCustomers: 0 andSuspendedCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertTotalCustomersAndActiveCustomers: 0 andSuspendedCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self do:[ customerBook suspendCustomerNamed: 'George Harrison' ]
		throw: CantSuspend 
		asserting: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ja 4/14/2021 16:31:20'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self do:[ customerBook suspendCustomerNamed: johnLennon ]
		throw: CantSuspend 
		asserting: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'setUp' stamp: 'ja 4/14/2021 16:31:20'!
setUp

	customerBook _ CustomerBook new. ! !


!CustomerBookTest methodsFor: 'private' stamp: 'ja 4/14/2021 15:56:53'!
assertDo: aBlock takeLessTimeThat: aMaxTime
 	
	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning  - millisecondsBeforeRunning) < aMaxTime
	
! !

!CustomerBookTest methodsFor: 'private' stamp: 'ja 4/14/2021 16:31:20'!
assertTotalCustomersAndActiveCustomers: anAmountOfActiveCustomers andSuspendedCustomers: anAmountOfSuspendedCustomers
	
	self assert: anAmountOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: anAmountOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: anAmountOfActiveCustomers + anAmountOfSuspendedCustomers equals: customerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'private' stamp: 'ja 4/14/2021 16:13:30'!
do: aBlock throw: anException asserting: assertionsBlock 

	[ aBlock value.  self fail ]
		on: anException 
		do: assertionsBlock! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'private' stamp: 'ja 4/14/2021 17:03:20'!
removeFrom: aCollectionOfCustomers thisCustomer: aName ifNotFoundDo: aBlock
 
	1 to: aCollectionOfCustomers size do: 
	[ :index |
		aName = (aCollectionOfCustomers at: index)
			ifTrue: [
				aCollectionOfCustomers removeAt: index.
				^ aName 
			] 
	].

	^ aBlock value.
! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ja 4/14/2021 22:44:20'!
removeCustomerNamed: aName 
 
	self removeFrom: active thisCustomer: aName ifNotFoundDo: [
		self removeFrom: suspended thisCustomer: aName ifNotFoundDo: [^ NotFound signal.]]  
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ja 4/14/2021 16:49:19'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !
