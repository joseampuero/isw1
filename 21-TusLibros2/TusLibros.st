!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'storeTestSimulator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:51:47'!
test01NewCartsAreCreatedEmpty

	self assert: storeTestSimulator createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:14'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := storeTestSimulator createCart.
	
	self 
		should: [ cart add: storeTestSimulator itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:51:54'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := storeTestSimulator createCart.
	
	cart add: storeTestSimulator itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:19'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := storeTestSimulator createCart.
	
	self 
		should: [cart add: 0 of: storeTestSimulator itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:22'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := storeTestSimulator createCart.
	
	self 
		should: [cart add: 2 of: storeTestSimulator itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:27'!
test06CartRemembersAddedItems

	| cart |
	
	cart := storeTestSimulator createCart.
	
	cart add: storeTestSimulator itemSellByTheStore.
	self assert: (cart includes: storeTestSimulator itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:30'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := storeTestSimulator createCart.
	
	self deny: (cart includes: storeTestSimulator itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 17:52:34'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := storeTestSimulator createCart.
	
	cart add: 2 of: storeTestSimulator itemSellByTheStore.
	self assert: (cart occurrencesOf: storeTestSimulator itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'Ciro 6/13/2021 17:51:39'!
setUp

	storeTestSimulator _ StoreTestSimulator new! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'storeTestSimulator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 18:04:52'!
test01CanNotCheckoutWithAnEmptyCart

	| cart creditCard sales |
	
	cart _ storeTestSimulator createCart.
	creditCard _ CreditCard new.
	sales _ OrderedCollection new.
	
	self should: [ Cashier checkout: cart chargingOn: creditCard registerOn: sales ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotCheckoutWithAnEmptyCartErrorDescription]! !

!CashierTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 18:04:36'!
test02CanNotCheckoutWithAnInvalidCreditCard

	| cart creditCard sales |
	
	cart _ storeTestSimulator createCart.
	cart add: storeTestSimulator itemSellByTheStore.
	sales _ OrderedCollection new.
	creditCard _ CreditCard expireOn: (Date yesterday).
	
	self should: [ Cashier checkout: cart chargingOn: creditCard registerOn: sales ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotCheckoutWithAnInvalidCreditCardErrorDescription ]! !

!CashierTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 18:03:28'!
test03CalculateCheckoutIsCorrect

	| cart creditCard cashier sales |
	
	cart _ storeTestSimulator createCart.
	cart add: 3 of: storeTestSimulator itemSellByTheStore.
	sales _ OrderedCollection new.
	creditCard _ CreditCard expireOn: (Date tomorrow).
	cashier _ Cashier checkout: cart chargingOn: creditCard registerOn: sales.
	
	self assert: cashier checkOut equals: 30! !

!CashierTest methodsFor: 'tests' stamp: 'Ciro 6/13/2021 18:11:51'!
test04ValidCheckoutRegistersASale

	| cart creditCard cashier sales total |
	
	cart _ storeTestSimulator createCart.
	cart add: 3 of: storeTestSimulator itemSellByTheStore.
	sales _ OrderedCollection new.
	creditCard _ CreditCard expireOn: (Date tomorrow).
	cashier _ Cashier checkout: cart chargingOn: creditCard registerOn: sales.
	total _ cashier checkOut.
	
	self deny: sales isEmpty.
	self assert: total = sales first.! !


!CashierTest methodsFor: 'set up' stamp: 'Ciro 6/13/2021 17:53:49'!
setUp

	storeTestSimulator _ StoreTestSimulator new! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'Ciro 6/13/2021 17:43:26'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'Ciro 6/13/2021 18:11:12'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard salesCollection total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'Ciro 6/13/2021 18:02:42'!
initializeToCheckout: aCart chargingOn: aCreditCard registerOn: aSalesCollection

	cart _ aCart.
	creditCard _ aCreditCard.
	salesCollection _ aSalesCollection! !


!Cashier methodsFor: 'private' stamp: 'Ciro 6/13/2021 18:09:08'!
calculateTotal

	total _ cart total! !

!Cashier methodsFor: 'private' stamp: 'Ciro 6/13/2021 18:09:42'!
registerSale

	salesCollection add: total! !


!Cashier methodsFor: 'check out' stamp: 'Ciro 6/13/2021 18:08:50'!
checkOut

	self calculateTotal.
	self registerSale.
	
	^ total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'Ciro 6/13/2021 18:03:54'!
checkout: aCart chargingOn: aCreditCard registerOn: aSalesCollecion

	self assertCartNotEmpty: aCart.
	
	self assertValidCreditCard: aCreditCard.

	^ self new initializeToCheckout: aCart chargingOn: aCreditCard registerOn: aSalesCollecion! !


!Cashier class methodsFor: 'assertion' stamp: 'Ciro 6/13/2021 16:54:55'!
assertCartNotEmpty: aCart

	aCart isEmpty ifTrue: [ self error: self canNotCheckoutWithAnEmptyCartErrorDescription ]! !

!Cashier class methodsFor: 'assertion' stamp: 'Ciro 6/13/2021 17:26:10'!
assertValidCreditCard: aCreditCard

	aCreditCard isExpired ifTrue: [self error: self canNotCheckoutWithAnInvalidCreditCardErrorDescription]! !


!Cashier class methodsFor: 'error description' stamp: 'Ciro 6/13/2021 16:50:47'!
canNotCheckoutWithAnEmptyCartErrorDescription
	
	^ 'Can not checkout with an empty cart'! !

!Cashier class methodsFor: 'error description' stamp: 'Ciro 6/13/2021 17:10:30'!
canNotCheckoutWithAnInvalidCreditCardErrorDescription
	
	^ 'Can not checkout with an invalid credit card'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'date expiredDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'Ciro 6/13/2021 17:09:19'!
initializeExpiringOn: aDate 
	
	expiredDate _ aDate! !


!CreditCard methodsFor: 'expired' stamp: 'Ciro 6/13/2021 17:13:12'!
isExpired

	^ expiredDate < DateAndTime now date! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'Ciro 6/13/2021 17:08:57'!
expireOn: aDate 
	
	^ self new initializeExpiringOn: aDate! !


!classDefinition: #StoreTestSimulator category: 'TusLibros'!
Object subclass: #StoreTestSimulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestSimulator methodsFor: 'cart' stamp: 'Ciro 6/13/2021 17:49:18'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !


!StoreTestSimulator methodsFor: 'items' stamp: 'Ciro 6/13/2021 17:37:25'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestSimulator methodsFor: 'items' stamp: 'Ciro 6/13/2021 17:39:19'!
itemNotSellByTheStorePrice

	^ 10! !

!StoreTestSimulator methodsFor: 'items' stamp: 'Ciro 6/13/2021 17:37:33'!
itemSellByTheStore
	
	^ 'validBook'! !


!StoreTestSimulator methodsFor: 'catalog' stamp: 'Ciro 6/13/2021 17:47:20'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemNotSellByTheStorePrice;
		yourself ! !
