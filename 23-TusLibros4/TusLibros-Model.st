!classDefinition: #TusLibrosClientWindow category: 'TusLibros-Model'!
Panel subclass: #TusLibrosClientWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'ja 7/2/2021 18:18:21'!
defaultExtent

	^ 1000@485! !


!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'ja 7/1/2021 16:59:56'!
initializeDefaultWindow

	TusLibrosClientWindowCreate open.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindow class' category: 'TusLibros-Model'!
TusLibrosClientWindow class
	instanceVariableNames: ''!

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'ja 7/1/2021 16:58:10'!
open

	^ self new initializeDefaultWindow! !


!classDefinition: #TusLibrosClientWindowAddToCart category: 'TusLibros-Model'!
TusLibrosClientWindow subclass: #TusLibrosClientWindowAddToCart
	instanceVariableNames: 'cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowAddToCart methodsFor: 'GUI building' stamp: 'ja 7/7/2021 17:29:25'!
buid1stMainRow

	| mainRow | 
	
	mainRow := LayoutMorph newRow .
	mainRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: self build1stColumn;
	addMorph: self build2ndColumn.
	
	mainRow layoutSpec fixedWidth: 390.
		
	^mainRow.
	! !

!TusLibrosClientWindowAddToCart methodsFor: 'GUI building' stamp: 'ja 7/8/2021 15:19:22'!
build1stColumn

	| catalogListMorph quantityTextBoxMorph firstColumnOfFirstRow addToCartButtonMorph |
	
	addToCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil action: #addToCartActionButton label: 'Agregar al carrito'.	
	
	catalogListMorph := PluggableListMorph model: self model listGetter: #catalog indexGetter: #catalogListIndex indexSetter: #catalogListIndex:.
	catalogListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
	
	quantityTextBoxMorph := TextModelMorph textProvider: self model textGetter: #quantityText textSetter: #quantityText:. 
	quantityTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | quantityTextBoxMorph textMorph acceptContents ] .
	quantityTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 300; morphHeight: 50. 
	
	firstColumnOfFirstRow := LayoutMorph newColumn.
	firstColumnOfFirstRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Catalogo');
	addMorph: catalogListMorph;
	addMorph: (LabelMorph contents:'Ingrese una cantidad:');
	addMorph: quantityTextBoxMorph;
	addMorph: addToCartButtonMorph.
	
	firstColumnOfFirstRow layoutSpec fixedWidth: 390.
		
	^firstColumnOfFirstRow.
	! !

!TusLibrosClientWindowAddToCart methodsFor: 'GUI building' stamp: 'ja 7/8/2021 15:18:39'!
build2ndColumn

	| secondColumnOfFirstRow removeToCartButtonMorph checkoutButtonMorph |
	
	removeToCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #removeToCartActionButton label: 'Eliminar del carrito'.	
	
	checkoutButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #checkoutToCartActionButton label: 'Check Out'.	
	
	cartListMorph := PluggableListMorph model: self model listGetter: #cart indexGetter: #cartListIndex indexSetter: #cartListIndex:.
	cartListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
	
	secondColumnOfFirstRow := LayoutMorph newColumn.
	secondColumnOfFirstRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Carrito');
	addMorph: cartListMorph;
	addMorph: removeToCartButtonMorph;
	addMorph: checkoutButtonMorph.
	
	secondColumnOfFirstRow layoutSpec fixedWidth: 390.
		
	^secondColumnOfFirstRow.
	! !

!TusLibrosClientWindowAddToCart methodsFor: 'GUI building' stamp: 'ja 7/7/2021 23:12:16'!
build2ndRow

	| secondRow historyButtonMorph |
	
	historyButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #historyToCartActionButton label: 'Historial de compras'.	
	
	secondRow := LayoutMorph newColumn.
	secondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: historyButtonMorph.
	
	secondRow layoutSpec fixedWidth: 390.
		
	^secondRow.
	! !

!TusLibrosClientWindowAddToCart methodsFor: 'GUI building' stamp: 'ja 7/7/2021 22:48:46'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self buid1stMainRow;
	addMorph: self build2ndRow.! !


!TusLibrosClientWindowAddToCart methodsFor: 'initialization' stamp: 'ja 7/7/2021 23:14:55'!
initializeWith: aTitle with: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword  

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModelAddToCart with: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #newItemsArrived send: #refreshCartListOfItems to: self.! !


!TusLibrosClientWindowAddToCart methodsFor: 'update' stamp: 'ja 7/3/2021 15:08:41'!
refreshCartListOfItems
	
	cartListMorph updateList.
	cartListMorph setSelectionIndex: 0.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowAddToCart class' category: 'TusLibros-Model'!
TusLibrosClientWindowAddToCart class
	instanceVariableNames: ''!

!TusLibrosClientWindowAddToCart class methodsFor: 'instance creation' stamp: 'ja 7/8/2021 15:15:29'!
openWith: aCatalog for: aCartId userName: anUserName andPassword: aPassword  

	^self new initializeWith: ('Tus Libros - Bievenido ',anUserName asString) with: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword.! !


!classDefinition: #TusLibrosClientWindowCreate category: 'TusLibros-Model'!
TusLibrosClientWindow subclass: #TusLibrosClientWindowCreate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowCreate methodsFor: 'initialization' stamp: 'ja 7/7/2021 23:21:07'!
initializeWith: aTitle

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModelCreate new).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			! !


!TusLibrosClientWindowCreate methodsFor: 'GUI building' stamp: 'ja 7/4/2021 11:20:59'!
build1stRow

	| sendRequestButtonMorph firstRowLayoutMorph userNameTextBoxMorph passwordTextBoxMorph |
	
	sendRequestButtonMorph := PluggableButtonMorph model: self model stateGetter: nil action: #createCartRequest  label: 'Create cart'.
	
	userNameTextBoxMorph := TextModelMorph textProvider: self model textGetter: #userNameText textSetter: #userNameText:. 
	userNameTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | userNameTextBoxMorph textMorph acceptContents ] .
	userNameTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 200; morphHeight: 50. 
	
	passwordTextBoxMorph := TextModelMorph textProvider: self model textGetter: #passwordText textSetter: #passwordText:. 
	passwordTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | passwordTextBoxMorph textMorph acceptContents ] .
	passwordTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 200; morphHeight: 50. 
		
	firstRowLayoutMorph := LayoutMorph newColumn.
	firstRowLayoutMorph separation: 10;
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Enter user name:');
	addMorph: userNameTextBoxMorph.
	
	firstRowLayoutMorph separation: 10;
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Enter password:');
	addMorph: passwordTextBoxMorph;
 	addMorph: sendRequestButtonMorph.
	
	^ firstRowLayoutMorph.! !

!TusLibrosClientWindowCreate methodsFor: 'GUI building' stamp: 'ja 6/30/2021 20:00:01'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowCreate class' category: 'TusLibros-Model'!
TusLibrosClientWindowCreate class
	instanceVariableNames: ''!

!TusLibrosClientWindowCreate class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 22:38:10'!
open
	
	^self new initializeWith: 'Tus Libros'.! !


!classDefinition: #TusLibrosClientWindowError category: 'TusLibros-Model'!
TusLibrosClientWindow subclass: #TusLibrosClientWindowError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowError methodsFor: 'initialization' stamp: 'ja 7/7/2021 19:07:02'!
intializeWith: aTitle withMessage: aMessage

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModelError withMessage: aMessage).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.! !


!TusLibrosClientWindowError methodsFor: 'GUI building' stamp: 'ja 7/7/2021 19:21:06'!
build1stRow

	| firstColumnLayoutMorphOfSecondRow continueShoppingButtonMorph |
	
	continueShoppingButtonMorph := TextModelMorph withText: self model errorMessage.	
	
	firstColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Error:');
	addMorph: continueShoppingButtonMorph.
	
	
	firstColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
		
	^firstColumnLayoutMorphOfSecondRow.
	
	! !

!TusLibrosClientWindowError methodsFor: 'GUI building' stamp: 'ja 7/7/2021 19:08:58'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow.! !

!TusLibrosClientWindowError methodsFor: 'GUI building' stamp: 'ja 7/7/2021 22:42:11'!
defaultExtent

	^ 800@300! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowError class' category: 'TusLibros-Model'!
TusLibrosClientWindowError class
	instanceVariableNames: ''!

!TusLibrosClientWindowError class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 19:06:00'!
openWith: aMessage

	^ self new intializeWith: 'Ocurrio un error inesparado' withMessage: aMessage! !


!classDefinition: #TusLibrosClientWindowPurchases category: 'TusLibros-Model'!
TusLibrosClientWindow subclass: #TusLibrosClientWindowPurchases
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowPurchases methodsFor: 'initialization' stamp: 'ja 7/8/2021 15:23:20'!
initializeWith: aTitle withPurchases: aPurchases 

self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModelPurchases with: aPurchases).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			! !


!TusLibrosClientWindowPurchases methodsFor: 'GUI building' stamp: 'ja 7/7/2021 18:11:45'!
build1stRow

	| firstColumnLayoutMorphOfSecondRow historyListMorph |
	
	historyListMorph := PluggableListMorph model: self model listGetter: #purchases indexGetter: #purchasesSelectedIndex indexSetter: #purchasesSelectedIndex:.
	historyListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
	
	firstColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Historial de compras');
	addMorph: historyListMorph.
	
	firstColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
		
	^firstColumnLayoutMorphOfSecondRow.! !

!TusLibrosClientWindowPurchases methodsFor: 'GUI building' stamp: 'ja 7/7/2021 17:46:35'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowPurchases class' category: 'TusLibros-Model'!
TusLibrosClientWindowPurchases class
	instanceVariableNames: ''!

!TusLibrosClientWindowPurchases class methodsFor: 'instance creation' stamp: 'ja 7/8/2021 15:16:11'!
withPurchases: aPurchases

	^ self new initializeWith: 'Tus Libros - Historial' withPurchases: aPurchases ! !


!classDefinition: #TusLibrosClientWindowTicket category: 'TusLibros-Model'!
TusLibrosClientWindow subclass: #TusLibrosClientWindowTicket
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowTicket methodsFor: 'initialization' stamp: 'ja 7/8/2021 15:23:27'!
initializeWith: aTitle for: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket 

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModelTicket for: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			! !


!TusLibrosClientWindowTicket methodsFor: 'GUI building' stamp: 'ja 7/7/2021 16:52:47'!
build1stRow

	| firstColumnLayoutMorphOfSecondRow continueShoppingButtonMorph ticketListMorph logOutButtonMorph |
	
	continueShoppingButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #continueShoppingActionButton label: 'Realizar otra compra'.	
	
	logOutButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #logOutActionButton label: 'Cerrar sesión'.	
	
	ticketListMorph := PluggableListMorph model: self model listGetter: #ticket indexGetter: #ticketSelectedIndex indexSetter: #ticketSelectedIndex.
	ticketListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
	
	firstColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Ticket Tus Libros');
	addMorph: ticketListMorph;
	addMorph: continueShoppingButtonMorph;
	addMorph: logOutButtonMorph.
	
	firstColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
		
	^firstColumnLayoutMorphOfSecondRow.
	! !

!TusLibrosClientWindowTicket methodsFor: 'GUI building' stamp: 'ja 7/7/2021 15:58:41'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowTicket class' category: 'TusLibros-Model'!
TusLibrosClientWindowTicket class
	instanceVariableNames: ''!

!TusLibrosClientWindowTicket class methodsFor: 'instance creation' stamp: 'ja 7/8/2021 15:16:46'!
for: aCartId withUserName: anUserName withPassword: aPassword andTicket: aTicket 

	^self new initializeWith: ('Tus Libros - Ticket - ', anUserName asString) for: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket.! !


!classDefinition: #Cart category: 'TusLibros-Model'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/21/2013 23:59'!
invalidItemErrorMessage

	^self class invalidItemErrorMessage ! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/22/2013 00:00'!
invalidQuantityErrorMessage

	^self class invalidQuantityErrorMessage ! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/22/2013 14:17'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self signalInvalidItem ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/22/2013 14:18'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [self signalInvalidQuantity ]! !


!Cart methodsFor: 'content' stamp: 'HernanWilkinson 6/22/2013 12:17'!
catalog

	^ catalog! !

!Cart methodsFor: 'content' stamp: 'HernanWilkinson 6/22/2013 12:30'!
content

	^items copy! !

!Cart methodsFor: 'content' stamp: 'HernanWilkinson 6/23/2013 12:10'!
itemsAndQuantitiesDo: aBlock

	^ items contents keysAndValuesDo: [ :anItem :aQuantity | aBlock value: anItem value: aQuantity ]! !

!Cart methodsFor: 'content' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 12:29'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'error signal' stamp: 'ja 7/3/2021 15:55:37'!
itemIsNotInTheCartErrorDescription

	^ 'Item Is Not In The Cart'! !

!Cart methodsFor: 'error signal' stamp: 'HernanWilkinson 6/22/2013 14:18'!
signalInvalidItem

	self error: self invalidItemErrorMessage! !

!Cart methodsFor: 'error signal' stamp: 'HernanWilkinson 6/22/2013 14:19'!
signalInvalidQuantity

	self error: self invalidQuantityErrorMessage ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty

	^items isEmpty ! !


!Cart methodsFor: 'removing' stamp: 'ja 7/3/2021 15:55:05'!
remove: anItem

	items remove: anItem ifAbsent:[self error: self itemIsNotInTheCartErrorDescription]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/22/2013 12:31'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items add: anItem withOccurrences: aQuantity ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros-Model'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/21/2013 23:59'!
invalidItemErrorMessage

	^'Item is not in catalog'! !

!Cart class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/22/2013 00:00'!
invalidQuantityErrorMessage

	^'Invalid number of items'! !


!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartSession category: 'TusLibros-Model'!
Object subclass: #CartSession
	instanceVariableNames: 'owner cart lastUsedTime systemFacade'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!CartSession methodsFor: 'time/expiration' stamp: 'HernanWilkinson 6/17/2015 20:34'!
assertIsNotExpirtedAt: aTime

	(self isExpiredAt: aTime) ifTrue: [ self signalCartSessionExpired ]! !

!CartSession methodsFor: 'time/expiration' stamp: 'HernanWilkinson 6/17/2015 20:36'!
isExpiredAt: aTime

	^ (lastUsedTime + systemFacade sessionDuration) < aTime! !

!CartSession methodsFor: 'time/expiration' stamp: 'HernanWilkinson 6/17/2015 20:36'!
now

	^systemFacade now! !

!CartSession methodsFor: 'time/expiration' stamp: 'HernanWilkinson 6/17/2015 20:37'!
today

	^systemFacade today! !


!CartSession methodsFor: 'session management' stamp: 'HernanWilkinson 6/17/2015 20:35'!
do: aBlock

	| now |

	now := self now.
	self assertIsNotExpirtedAt: now.

	^ [ aBlock value: self ] ensure: [ lastUsedTime := now  ]! !


!CartSession methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2015 20:36'!
initializeOwnedBy: aCustomer with: aCart on: aSystemFacade

	owner := aCustomer.
	cart := aCart.
	systemFacade := aSystemFacade.
	lastUsedTime := self now.! !


!CartSession methodsFor: 'error signal' stamp: 'HernanWilkinson 6/17/2015 20:37'!
signalCartSessionExpired

	self error: systemFacade sessionHasExpiredErrorDescription ! !


!CartSession methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2015 20:34'!
addToCart: anAmount of: aBook

	^cart add: anAmount of: aBook! !

!CartSession methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2015 20:35'!
cartContent

	^cart content! !

!CartSession methodsFor: 'cart' stamp: 'ja 7/6/2021 20:39:22'!
checkOutCartWithCreditCardNumbered: aCreditCardNumber ownedBy: anOwner expiringOn: anExpirationMonthOfYear

	^(Cashier
		toCheckout: cart
		ownedBy: owner
		charging: (CreditCard expiringOn: anExpirationMonthOfYear withNumber: aCreditCardNumber)
		throught: systemFacade merchantProcessor
		on: self today
		registeringOn: systemFacade salesBook) checkOut ! !

!CartSession methodsFor: 'cart' stamp: 'ja 7/3/2021 16:08:30'!
removeToCart: aBook

	^ cart remove: aBook ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: 'TusLibros-Model'!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2015 20:37'!
ownedBy: aCustomer with: aCart on: aSystemFacade

	^self new initializeOwnedBy: aCustomer with: aCart on: aSystemFacade! !


!classDefinition: #Cashier category: 'TusLibros-Model'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard owner ticket'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/22/2013 12:17'!
createLineItemOf: anItem quantity: aQuantity

	^LineItem of: anItem quantity: aQuantity total: (self totalOf: anItem quantity: aQuantity) ! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/22/2013 12:25'!
createSale

	^ Sale doneBy: owner certifiedWith: ticket
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/22/2013 12:28'!
createTicket

	| lineItems |

	lineItems := OrderedCollection new.
	cart itemsAndQuantitiesDo: [ :anItem :aQuantity |
		lineItems add: (self createLineItemOf: anItem quantity: aQuantity)].

	ticket := Ticket of: lineItems
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/22/2013 12:20'!
debitTotal

	merchantProcessor debit: ticket total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/22/2013 12:17'!
totalOf: anItem quantity: aQuantity

	^(cart catalog at: anItem) * aQuantity  ! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/22/2013 12:28'!
checkOut

	self createTicket.
	self debitTotal.
	self registerSale.

	^ ticket ! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 12:02'!
initializeToCheckout: aCart ownedBy: anOwner charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook

	cart := aCart.
	owner := anOwner.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros-Model'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage

	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage

	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage

	^'Credit card has no credit'! !


!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/22/2013 14:22'!
assertIsNotEmpty: aCart

	aCart isEmpty ifTrue: [self signalCartCanNotBeEmpty ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/22/2013 14:22'!
assertIsNotExpired: aCreditCard on: aDate

	(aCreditCard isExpiredOn: aDate) ifTrue: [self signalCanNotChargeAnExpiredCreditCard]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/22/2013 12:00'!
toCheckout: aCart ownedBy: anOwner charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook

	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.

	^self new initializeToCheckout: aCart ownedBy: anOwner charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error signal' stamp: 'HernanWilkinson 6/22/2013 14:22'!
signalCanNotChargeAnExpiredCreditCard

	 self error: self canNotChargeAnExpiredCreditCardErrorMessage ! !

!Cashier class methodsFor: 'error signal' stamp: 'HernanWilkinson 6/22/2013 14:22'!
signalCartCanNotBeEmpty

	self error: self cartCanNotBeEmptyErrorMessage! !


!classDefinition: #Clock category: 'TusLibros-Model'!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Clock methodsFor: 'time' stamp: 'HernanWilkinson 6/22/2013 14:23'!
now

	self subclassResponsibility ! !

!Clock methodsFor: 'time' stamp: 'HernanWilkinson 6/22/2013 14:23'!
today

	self subclassResponsibility ! !


!classDefinition: #CreditCard category: 'TusLibros-Model'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate

	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'accessing' stamp: 'ja 7/6/2021 20:53:51'!
expiration

	^ expiration ! !

!CreditCard methodsFor: 'accessing' stamp: 'ja 7/6/2021 20:53:42'!
number

	^ number ! !


!CreditCard methodsFor: 'initialization' stamp: 'ja 7/6/2021 20:42:41'!
initializeExpiringOn: aMonth withNumber: aCreditCardNumber 

	expiration := aMonth.
	number _ aCreditCardNumber 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros-Model'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'ja 7/6/2021 20:41:26'!
expiringOn: aMonth withNumber: aCreditCardNumber  

	^self new initializeExpiringOn: aMonth withNumber: aCreditCardNumber! !


!classDefinition: #LineItem category: 'TusLibros-Model'!
Object subclass: #LineItem
	instanceVariableNames: 'item quantity total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!LineItem methodsFor: 'accessing' stamp: 'HernanWilkinson 6/22/2013 12:33'!
item

	^ item! !

!LineItem methodsFor: 'accessing' stamp: 'ja 7/7/2021 18:26:12'!
quantity

	^ quantity! !

!LineItem methodsFor: 'accessing' stamp: 'HernanWilkinson 6/22/2013 12:21'!
total

	^ total! !


!LineItem methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 12:18'!
initializeOf: anItem quantity: aQuantity total: aTotal

	item := anItem.
	quantity := aQuantity.
	total := aTotal

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LineItem class' category: 'TusLibros-Model'!
LineItem class
	instanceVariableNames: ''!

!LineItem class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/22/2013 12:18'!
of: anItem quantity: aQuantity total: aTotal

	^self new initializeOf: anItem quantity: aQuantity total: aTotal

! !


!classDefinition: #MerchantProcessor category: 'TusLibros-Model'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!MerchantProcessor methodsFor: 'debit' stamp: 'HernanWilkinson 6/22/2013 14:31'!
README

	"Aunque nadie subclasifica esta clase, esta para definir el protocolo que se espera que todo MerchantProcessor sepa responder - Hernan"! !

!MerchantProcessor methodsFor: 'debit' stamp: 'HernanWilkinson 6/22/2013 14:30'!
debit: anAmount from: aCreditCard

	self subclassResponsibility ! !


!classDefinition: #MerchantProcessorForInterface category: 'TusLibros-Model'!
MerchantProcessor subclass: #MerchantProcessorForInterface
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!MerchantProcessorForInterface methodsFor: 'debit' stamp: 'ja 6/30/2021 19:29:49'!
debit: anAmount from: aCreditCard
! !


!classDefinition: #Sale category: 'TusLibros-Model'!
Object subclass: #Sale
	instanceVariableNames: 'customer ticket'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Sale methodsFor: 'testing' stamp: 'HernanWilkinson 6/22/2013 12:06'!
wasDoneBy: aCustomer

	^customer = aCustomer ! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 12:26'!
initializeDoneBy: aCustomer certifiedWith: aTicket

	customer := aCustomer.
	ticket := aTicket ! !


!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/22/2013 12:26'!
total

	^ ticket total! !


!Sale methodsFor: 'line items' stamp: 'HernanWilkinson 6/22/2013 12:33'!
lineItemsDo: aBlock

	^ticket lineItemsDo: aBlock ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros-Model'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/22/2013 12:25'!
doneBy: aCustomer certifiedWith: aTicket

	^self new initializeDoneBy: aCustomer certifiedWith: aTicket ! !


!classDefinition: #Ticket category: 'TusLibros-Model'!
Object subclass: #Ticket
	instanceVariableNames: 'lineItems'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Ticket methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2015 20:39'!
total

	^lineItems sum: [ :aLineItem | aLineItem total]! !


!Ticket methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 12:20'!
initializeOf: aCollectionOfLineItems

	lineItems := aCollectionOfLineItems ! !


!Ticket methodsFor: 'line items' stamp: 'HernanWilkinson 6/22/2013 12:33'!
lineItemsDo: aBlock

	^lineItems do: aBlock ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ticket class' category: 'TusLibros-Model'!
Ticket class
	instanceVariableNames: ''!

!Ticket class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/22/2013 12:20'!
of: aCollectionOfLineItems

	^self new initializeOf: aCollectionOfLineItems ! !


!classDefinition: #TusLibrosClientWindowModelAddToCart category: 'TusLibros-Model'!
Object subclass: #TusLibrosClientWindowModelAddToCart
	instanceVariableNames: 'catalog cartId catalogSelectedIndex cart cartSelectedIndex quantity interface catalogListISBN password userName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowModelAddToCart methodsFor: 'initialization' stamp: 'ja 7/7/2021 21:44:58'!
initializeWith: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword   

	catalog _ aCatalog .
	cartId _ aCartId.
	userName _ anUserName.
	catalogSelectedIndex _ 0.
	password _ aPassword .
	
	cart _ OrderedCollection new.
	cartSelectedIndex _ 0.
	
	quantity _ ''.
	
	interface _ TusLibrosInterface new.! !


!TusLibrosClientWindowModelAddToCart methodsFor: 'adding' stamp: 'ja 7/7/2021 23:20:23'!
addToCartActionButton
	
	(catalogSelectedIndex = 0) ifFalse: [ | selectedISBN selectedBooks |
		
		selectedISBN _ catalogListISBN at: catalogSelectedIndex .
		
		interface sendRequestForAddToCart: cartId of: selectedISBN with: quantity.
		
		selectedBooks _ interface sendRequesForListCart: cartId.
		
		cart _ OrderedCollection new. 
		
		selectedBooks keysAndValuesDo:[:anISBN :aNumberOfTimes | aNumberOfTimes timesRepeat:[cart add: anISBN] ].
		
		self triggerEvent: #newItemsArrived with: self.]
		! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'adding' stamp: 'ja 7/3/2021 18:33:18'!
catalogListIndex
	
	^catalogSelectedIndex.! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'adding' stamp: 'ja 7/3/2021 18:33:18'!
catalogListIndex: anIndex
	
	catalogSelectedIndex := anIndex.! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'adding' stamp: 'ja 7/2/2021 16:44:17'!
quantityText

	^quantity! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'adding' stamp: 'ja 7/2/2021 17:04:08'!
quantityText: aNumber

	quantity _ aNumber.
	^true.! !


!TusLibrosClientWindowModelAddToCart methodsFor: 'catalog' stamp: 'ja 7/7/2021 23:15:43'!
catalog

	| catalogList |
	
	catalogList _ OrderedCollection new.
	catalogListISBN _ OrderedCollection new.
	catalog keysAndValuesDo: 
		[:anISBN :aNameBook | catalogList add: anISBN,' ',aNameBook. 
							catalogListISBN add: anISBN].
	
	
	^catalogList! !


!TusLibrosClientWindowModelAddToCart methodsFor: 'removing' stamp: 'ja 7/2/2021 16:18:49'!
cart

	^ cart! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'removing' stamp: 'ja 7/2/2021 16:19:17'!
cartListIndex

	^ cartSelectedIndex ! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'removing' stamp: 'ja 7/2/2021 16:19:08'!
cartListIndex: anIndex

	cartSelectedIndex _ anIndex ! !

!TusLibrosClientWindowModelAddToCart methodsFor: 'removing' stamp: 'ja 7/7/2021 23:16:46'!
removeToCartActionButton

	(cartSelectedIndex = 0) ifFalse:[| selectedISBN selectedBooks |
		
		selectedISBN _ cart at: cartSelectedIndex.
		
		interface sendRequestForRemoveToCart: cartId of: selectedISBN.
		
		selectedBooks _ interface sendRequesForListCart: cartId.
		
		cart _ OrderedCollection new. 
		selectedBooks keysAndValuesDo:[:anISBN :aNumberOfTimes | aNumberOfTimes timesRepeat:[cart add: anISBN] ].
		
		self triggerEvent: #newItemsArrived with: self]! !


!TusLibrosClientWindowModelAddToCart methodsFor: 'check out' stamp: 'ja 7/7/2021 21:46:39'!
checkoutToCartActionButton

	| ticket |
	[ticket _ interface sendRequestForCheckoutToCart: cartId for: userName]
	on: Error
	do:[:anError | | message | 
		message _ interface messageTextError: anError messageText.
		^TusLibrosClientWindowError openWith: message].
	
	TusLibrosClientWindowTicket for: cartId withUserName: userName withPassword: password andTicket: ticket.! !


!TusLibrosClientWindowModelAddToCart methodsFor: 'history' stamp: 'ja 7/7/2021 23:16:03'!
historyToCartActionButton
	
	| purchases |
	
	purchases _  interface sendRequestForListPurchases: userName .
	
	TusLibrosClientWindowPurchases withPurchases: purchases.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowModelAddToCart class' category: 'TusLibros-Model'!
TusLibrosClientWindowModelAddToCart class
	instanceVariableNames: ''!

!TusLibrosClientWindowModelAddToCart class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 17:16:57'!
with: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword  

	^ self new initializeWith: aCatalog for: aCartId andUserName: anUserName andPassword: aPassword ! !


!classDefinition: #TusLibrosClientWindowModelCreate category: 'TusLibros-Model'!
Object subclass: #TusLibrosClientWindowModelCreate
	instanceVariableNames: 'cartId userName password interface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowModelCreate methodsFor: 'initialization' stamp: 'ja 7/7/2021 21:41:28'!
initialize 

	userName _ ''.
	password _ ''.
	interface _ TusLibrosInterface new.
! !


!TusLibrosClientWindowModelCreate methodsFor: 'request' stamp: 'ja 7/7/2021 22:33:20'!
createCartRequest
	
	| catalog |
	
	[cartId _ interface sendRequestForCreateCartWithUser: userName andPassword: password]
	on: Error
	do:[:anError | | message | 
		message _ interface messageTextError: anError messageText.
		^TusLibrosClientWindowError openWith: message].
	
	catalog _ interface sendRequestForCatalog.
	
	TusLibrosClientWindowAddToCart openWith: catalog for: cartId userName: userName andPassword: password.
	
	! !


!TusLibrosClientWindowModelCreate methodsFor: 'selectors' stamp: 'ja 7/7/2021 21:41:55'!
passwordText
	
	^password.! !

!TusLibrosClientWindowModelCreate methodsFor: 'selectors' stamp: 'ja 7/7/2021 21:41:49'!
passwordText: aSentence
	
	password := aSentence.
	^true.! !

!TusLibrosClientWindowModelCreate methodsFor: 'selectors' stamp: 'ja 7/7/2021 21:41:44'!
userNameText
	
	^userName.! !

!TusLibrosClientWindowModelCreate methodsFor: 'selectors' stamp: 'ja 7/7/2021 21:41:39'!
userNameText: aSentence
	
	userName := aSentence.
	^true.! !


!classDefinition: #TusLibrosClientWindowModelError category: 'TusLibros-Model'!
Object subclass: #TusLibrosClientWindowModelError
	instanceVariableNames: 'errorMessage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowModelError methodsFor: 'initialization' stamp: 'ja 7/7/2021 19:08:00'!
initializeWithMessage: aMessage 

	errorMessage _ aMessage ! !


!TusLibrosClientWindowModelError methodsFor: 'selectors' stamp: 'ja 7/7/2021 19:08:30'!
errorMessage
	
	^ errorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowModelError class' category: 'TusLibros-Model'!
TusLibrosClientWindowModelError class
	instanceVariableNames: ''!

!TusLibrosClientWindowModelError class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 19:07:39'!
withMessage: aMessage

	^ self new initializeWithMessage: aMessage ! !


!classDefinition: #TusLibrosClientWindowModelPurchases category: 'TusLibros-Model'!
Object subclass: #TusLibrosClientWindowModelPurchases
	instanceVariableNames: 'purchases purchasesSelectedIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowModelPurchases methodsFor: 'initialization' stamp: 'ja 7/7/2021 18:09:34'!
initializeWith: aPurchases

	purchases _ self list: aPurchases 	.
	purchasesSelectedIndex _ 0.! !


!TusLibrosClientWindowModelPurchases methodsFor: 'selectors' stamp: 'ja 7/7/2021 17:48:58'!
purchases
	 
	^ purchases ! !

!TusLibrosClientWindowModelPurchases methodsFor: 'selectors' stamp: 'ja 7/7/2021 17:49:54'!
purchasesSelectedIndex
	 
	 ^ purchasesSelectedIndex ! !

!TusLibrosClientWindowModelPurchases methodsFor: 'selectors' stamp: 'ja 7/7/2021 17:50:03'!
purchasesSelectedIndex: anIndex
	 
	 purchasesSelectedIndex _ anIndex ! !


!TusLibrosClientWindowModelPurchases methodsFor: 'private' stamp: 'ja 7/7/2021 18:30:41'!
list: aPurchases 	

	| purchasesToShow |
	
	purchasesToShow _ OrderedCollection new.
	
	aPurchases keysAndValuesDo: [:anItem :aPrice | purchasesToShow add: anItem,' ',aPrice].
	
	^ purchasesToShow reverse
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowModelPurchases class' category: 'TusLibros-Model'!
TusLibrosClientWindowModelPurchases class
	instanceVariableNames: ''!

!TusLibrosClientWindowModelPurchases class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 17:45:13'!
with: aPurchases

	^ self new initializeWith: aPurchases! !


!classDefinition: #TusLibrosClientWindowModelTicket category: 'TusLibros-Model'!
Object subclass: #TusLibrosClientWindowModelTicket
	instanceVariableNames: 'cartId ticketSelectedIndex ticket password user interface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosClientWindowModelTicket methodsFor: 'initialization' stamp: 'ja 7/7/2021 21:43:36'!
initializeFor: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket 

	cartId _ aCartId.
	interface _ TusLibrosInterface new.
	ticket _ self list: aTicket.
	password _ aPassword.
	user _ anUserName.
	
	ticketSelectedIndex _ 0.! !


!TusLibrosClientWindowModelTicket methodsFor: 'private' stamp: 'ja 7/7/2021 18:30:51'!
list: aTicket

	| ticketToShow |
	
	ticketToShow _ OrderedCollection new.
	
	aTicket keysAndValuesDo: [:anItem :aPrice | ticketToShow add: anItem,' ',aPrice].
	
	^ ticketToShow reverse
	! !


!TusLibrosClientWindowModelTicket methodsFor: 'selectors' stamp: 'ja 7/7/2021 16:44:23'!
ticket

	^ ticket ! !

!TusLibrosClientWindowModelTicket methodsFor: 'selectors' stamp: 'ja 7/7/2021 15:54:02'!
ticketSelectedIndex

	^ ticketSelectedIndex.! !

!TusLibrosClientWindowModelTicket methodsFor: 'selectors' stamp: 'ja 7/7/2021 15:54:21'!
ticketSelectedIndex: anIndex

	ticketSelectedIndex _ anIndex ! !


!TusLibrosClientWindowModelTicket methodsFor: 'action button' stamp: 'ja 7/8/2021 15:10:49'!
continueShoppingActionButton

	| catalog |
	cartId _ interface sendRequestForCreateCartWithUser: user andPassword: password.
	
	catalog _ interface sendRequestForCatalog.
	
	TusLibrosClientWindowAddToCart openWith: catalog for: cartId userName: user andPassword: password .! !

!TusLibrosClientWindowModelTicket methodsFor: 'action button' stamp: 'ja 7/7/2021 17:25:14'!
logOutActionButton

	TusLibrosClientWindow open. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindowModelTicket class' category: 'TusLibros-Model'!
TusLibrosClientWindowModelTicket class
	instanceVariableNames: ''!

!TusLibrosClientWindowModelTicket class methodsFor: 'instance creation' stamp: 'ja 7/7/2021 17:20:42'!
for: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket 

	^ self new initializeFor: aCartId userName: anUserName withPassword: aPassword andTicket: aTicket ! !


!classDefinition: #TusLibrosInterface category: 'TusLibros-Model'!
Object subclass: #TusLibrosInterface
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosInterface methodsFor: 'initialization' stamp: 'ja 7/1/2021 17:43:56'!
port

	^port ifNil: [port:=8083].! !

!TusLibrosInterface methodsFor: 'initialization' stamp: 'ja 7/1/2021 17:44:21'!
url 

	^'http://localhost:', self port asString! !


!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:21:17'!
sendRequesFor: anEndpoint with: fields 
	
	| response |
	response _ WebClient htmlSubmit: (self url,anEndpoint) fields: fields .
	
	response isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((response content) readStream))] 
		ifFalse:[^self error: response content].! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:26:49'!
sendRequesForListCart: aCartId 
	
	| fields |
	
	fields _ Dictionary new
	 	at: 'cartId' put: aCartId;
		yourself.
	
	^ self sendRequesFor: '/listCart' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:27:31'!
sendRequestForAddToCart: aCartId of: anISBN with: aQuantity
	
	| fields |
	
	fields _ Dictionary new
	 	at: 'cartId' put: aCartId;
	 	at: 'isbn' put: anISBN;
		at: 'quantity' put: aQuantity;
		yourself.
	
	^ self sendRequesFor: '/addToCart' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:28:24'!
sendRequestForCatalog
	
	| fields |
	
	fields _ Dictionary new.
	
	^ self sendRequesFor: '/catalog' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:28:59'!
sendRequestForCheckoutToCart: aCartId for: anUserName  
	
	| fields |
	
	fields _ Dictionary new
	 	at: 'cartId' put: aCartId;
		at: 'userName' put: anUserName;
		yourself.
	
	^ self sendRequesFor: '/checkoutCart' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:22:52'!
sendRequestForCreateCartWithUser: anUser andPassword: aPassword
	
	| fields |
	
	fields := Dictionary newFromPairs: {'clientId'. anUser} .		
	fields at: 'password' put: aPassword.
	
	^ self sendRequesFor: '/createCart' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:27:04'!
sendRequestForListPurchases: anUserName

	| fields |
	
	fields _ Dictionary new
	 	at: 'clientId' put: anUserName;
		yourself.
	
	^ self sendRequesFor: '/listPurchases' with: fields.! !

!TusLibrosInterface methodsFor: 'sending request' stamp: 'ja 7/7/2021 22:26:06'!
sendRequestForRemoveToCart: aCartId of: anISBN
	
	| fields |
	
	fields _ Dictionary new
	 	at: 'cartId' put: aCartId;
	 	at: 'isbn' put: anISBN;
		yourself.
	
	^ self sendRequesFor: '/removeToCart' with: fields.! !


!TusLibrosInterface methodsFor: 'converting' stamp: 'ja 7/7/2021 19:01:03'!
messageTextError: aMessageText

	^ aMessageText copyFrom: 87 to: (aMessageText size - 19) .
	! !


!classDefinition: #TusLibrosRestInterface category: 'TusLibros-Model'!
Object subclass: #TusLibrosRestInterface
	instanceVariableNames: 'facade server'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosRestInterface methodsFor: 'initialization' stamp: 'ja 6/30/2021 19:37:39'!
initializeWith: aFacade andServer: aServer

	facade _ aFacade .
	server _ aServer ! !


!TusLibrosRestInterface methodsFor: 'private' stamp: 'ja 7/7/2021 22:05:12'!
toEnconde: aTicket

	| ticketToEncode |
	
	ticketToEncode _ Dictionary new.
	aTicket lineItemsDo:[:anItem | ticketToEncode at: anItem item put: anItem total asString].
	ticketToEncode at: 'Total' put: aTicket total asString.
	
	^ ticketToEncode ! !


!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 19:26:12'!
addToCart: aRequest

	| cartId isbn quantity |

	[ | requestFields | 
	requestFields _ aRequest fields.
	cartId _ (requestFields at: 'cartId') asNumber.
	isbn _ requestFields at: 'isbn' .
	quantity _ (requestFields at: 'quantity') asNumber .] 
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
		
	[facade add: quantity of: isbn toCartIdentifiedAs: cartId.
	aRequest send200Response: (WebUtils jsonEncode: 'OK') ]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText)]! !

!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 22:04:21'!
checkoutCart: aRequest

	| cartId userName creditCartNumber creditCardExpirationMonthOfYear creditCardOwner |

	[ | requestFields creditCard | 
	requestFields _ aRequest fields.
	cartId _ (requestFields at: 'cartId') asNumber.
	userName _ requestFields at: 'userName'.
	creditCard _ self class validUsersAndCreditCards at: userName.
	creditCartNumber _ creditCard number.
       creditCardExpirationMonthOfYear := creditCard expiration.
	creditCardOwner _ userName]
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
		
	[ | ticket  ticketToEncode |
	
	ticket _ facade checkOutCartIdentifiedAs: cartId 
		withCreditCardNumbered: creditCartNumber 
		ownedBy: creditCardOwner 
		expiringOn: creditCardExpirationMonthOfYear.
	
	ticketToEncode _ self toEnconde: ticket.
	
	aRequest send200Response: (WebUtils jsonEncode: ticketToEncode)]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText)]! !

!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 19:25:34'!
createCart: aRequest

	| clientId password cartId |
	
	[ | requestFields | 
	requestFields _ aRequest fields.
	clientId _ requestFields at: 'clientId'.
	password _ requestFields at: 'password' ]
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
	
	
	[cartId _ facade createCartFor: clientId  authenticatedWith: password.
	aRequest send200Response: (WebUtils jsonEncode: cartId) ]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText)]
	! !

!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 22:08:17'!
listCart: aRequest

	| cartId response |

	[ | requestFields | 
	requestFields _ aRequest fields.
	cartId _ (requestFields at: 'cartId') asNumber]
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
		
	[ | itemByAmount |
		
	response _ facade listCartIdentifiedAs: cartId .
	itemByAmount _ Dictionary new.
	response do:[:anItem | itemByAmount at: anItem put: ((itemByAmount at: anItem ifAbsent:[0]) + 1)].
	aRequest send200Response: (WebUtils jsonEncode: itemByAmount)]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText)]! !

!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 19:26:25'!
listPurchases: aRequest

	| clientId password response|

	[ | requestFields | 
	requestFields _ aRequest fields.
	clientId _ requestFields at: 'clientId'.
	password _ self class validUsersAndPasswords at: clientId]
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
	
	
	[response _ facade listPurchasesOf: clientId authenticatingWith: password.
	response keysAndValuesDo:[:book :price | response at: book put: price asString ].
	aRequest send200Response: (WebUtils jsonEncode: response) ]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText)]! !

!TusLibrosRestInterface methodsFor: 'endpoints' stamp: 'ja 7/7/2021 19:26:32'!
removeToCart: aRequest

	| cartId isbn |

	[ | requestFields | 
	requestFields _ aRequest fields.
	cartId _ (requestFields at: 'cartId') asNumber.
	isbn _ requestFields at: 'isbn' .] 
	on: Error 
	do: [ :anError |
		aRequest send400Response: anError messageText ].
		
	[facade remove: isbn toCartIdentifiedAs: cartId.
	aRequest send200Response: (WebUtils jsonEncode: 'OK') ]
	on: Error
	do: [:anError | 
		aRequest send400Response: (WebUtils jsonEncode: anError messageText) ]! !


!TusLibrosRestInterface methodsFor: 'destroy' stamp: 'ja 6/30/2021 19:38:29'!
destroy
	
	server ifNotNil:[server destroy].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosRestInterface class' category: 'TusLibros-Model'!
TusLibrosRestInterface class
	instanceVariableNames: ''!

!TusLibrosRestInterface class methodsFor: 'instance creation' stamp: 'ja 7/3/2021 15:31:46'!
startIn: aPortNumber

	| server interface |
	
	server _ WebServer new listenOn: aPortNumber.
	
	interface _ self new initializeWith: (TusLibrosSystemFacade 
		authenticatingWith: self validUsersAndPasswords
		acceptingItemsOf: self defaultCatalogWithPrice
		registeringOn: self createSalesBook
		debitingThrought: self merchantProcessor
		measuringTimeWith: (ManualClock now: DateAndTime now)) andServer: server.
	
	server addService: '/createCart' action: [:request | interface createCart: request ].

	server addService: '/addToCart' action: [:request | interface addToCart: request].
	
	server addService: '/listCart' action: [:request | interface listCart: request].
	
	server addService: '/checkoutCart' action: [:request | interface checkoutCart: request].
	
	server addService: '/listPurchases' action: [:request | interface listPurchases: request].

	server addService: '/removeToCart' action: [:request | interface removeToCart: request].
	
	server addService: '/catalog' action: [:request | self defaultCatalog: request].
	
	! !


!TusLibrosRestInterface class methodsFor: 'catalog' stamp: 'ja 6/28/2021 19:52:45'!
createSalesBook

	^ OrderedCollection new.! !

!TusLibrosRestInterface class methodsFor: 'catalog' stamp: 'ja 7/1/2021 20:39:15'!
defaultCatalog

	^ Dictionary new
		at: 'libro1' put: 'MolecularBiologyOfTheCell';
		at: 'libro2' put: 'TheMythicalManMonth';
		at: 'libro3' put: 'ThePrincipia';
		at: 'libro4' put: 'BusinessAdventures';
		yourself .
		! !

!TusLibrosRestInterface class methodsFor: 'catalog' stamp: 'ja 7/1/2021 17:25:46'!
defaultCatalog: aRequest

	| catalog |
		
	[catalog _ self defaultCatalog.
	aRequest send200Response: (WebUtils jsonEncode: catalog) ]
	on: Error
	do: [:anError | 
		aRequest send200Response: anError messageText ]
	
	! !

!TusLibrosRestInterface class methodsFor: 'catalog' stamp: 'ja 7/1/2021 17:13:05'!
defaultCatalogWithPrice

	^ Dictionary new
		at: 'libro1' put: 10*peso;
		at: 'libro2' put: 20*peso;
		at: 'libro3' put: 30*peso;
		at: 'libro4' put: 15*peso;
		yourself .
		! !


!TusLibrosRestInterface class methodsFor: 'merchant processor' stamp: 'ja 6/30/2021 19:30:03'!
merchantProcessor

	^ MerchantProcessorForInterface new.! !


!TusLibrosRestInterface class methodsFor: 'authentication' stamp: 'ja 7/6/2021 20:48:06'!
validUsersAndCreditCards
	
	| notExpiredDate |
	
	notExpiredDate _ StoreTestObjectsFactory new yourself; notExpiredMonthOfYear.
	
	^ Dictionary new
		at: 'jose' put: (CreditCard expiringOn: notExpiredDate withNumber: '123451234512345');
		at: 'ciro' put: (CreditCard expiringOn: notExpiredDate withNumber: '678906789067890');
		yourself .
		! !

!TusLibrosRestInterface class methodsFor: 'authentication' stamp: 'ja 6/28/2021 20:00:50'!
validUsersAndPasswords

	^ Dictionary new
		at: 'jose' put: 'password1';
		at: 'ciro' put: 'password2';
		yourself .
		! !


!TusLibrosRestInterface class methodsFor: 'README' stamp: 'ja 7/1/2021 16:14:47'!
README

	"
	server _ TusLibrosRestInterface startIn: 8083.


	TusLibrosRestInterface allInstances do:[:x | x destroy].


	client _ TusLibrosClientWindow open.
	"! !


!classDefinition: #TusLibrosSystemFacade category: 'TusLibros-Model'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'validUsersAndPasswords catalog lastId merchantProcessor salesBook clock cartSessions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/22/2013 11:24'!
canNotChargeAnExpiredCreditCardErrorMessage

	^Cashier canNotChargeAnExpiredCreditCardErrorMessage ! !

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/22/2013 11:17'!
cartCanNotBeEmptyErrorMessage

	^Cashier cartCanNotBeEmptyErrorMessage ! !

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/21/2013 23:27'!
invalidCartIdErrorDescription

	^'Invalid cart id'! !

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/21/2013 23:59'!
invalidItemErrorMessage

	^Cart invalidItemErrorMessage ! !

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/21/2013 23:03'!
invalidUserAndOrPasswordErrorDescription

	^'Invalid user and/or password'! !

!TusLibrosSystemFacade methodsFor: 'error messages' stamp: 'HernanWilkinson 6/22/2013 13:07'!
sessionHasExpiredErrorDescription

	^'Can not use the cart after ', self sessionDuration minutes printString , ' minutes of inactivity'! !


!TusLibrosSystemFacade methodsFor: 'time' stamp: 'HernanWilkinson 6/22/2013 13:02'!
now

	^clock now! !

!TusLibrosSystemFacade methodsFor: 'time' stamp: 'HernanWilkinson 6/22/2013 12:49'!
today

	^clock today! !


!TusLibrosSystemFacade methodsFor: 'authentication' stamp: 'HernanWilkinson 6/23/2013 12:18'!
does: aUser authenticatesWith: aPassword

	"Recordar que esto es solo un ejemplo. No se deben guardar passwords en un sistema de verdad sino un
	hash o similar - Hernan"

	| storedPassword |

	storedPassword := validUsersAndPasswords at: aUser ifAbsent: [ ^false ].
	^aPassword = storedPassword ! !

!TusLibrosSystemFacade methodsFor: 'authentication' stamp: 'HernanWilkinson 6/23/2013 12:18'!
if: aUser authenticatesWith: aPassword do: aBlock

	^ (self does: aUser authenticatesWith: aPassword)
		ifTrue: aBlock
		ifFalse: [ self signalInvalidUserAndOrPassword ].
	! !


!TusLibrosSystemFacade methodsFor: 'error signal' stamp: 'HernanWilkinson 6/21/2013 23:27'!
signalInvalidCartId

	self error: self invalidCartIdErrorDescription ! !

!TusLibrosSystemFacade methodsFor: 'error signal' stamp: 'HernanWilkinson 6/21/2013 23:02'!
signalInvalidUserAndOrPassword

	self error: self invalidUserAndOrPasswordErrorDescription! !


!TusLibrosSystemFacade methodsFor: 'cart session management' stamp: 'HernanWilkinson 6/21/2013 23:32'!
generateCartId

	"Recuerden que esto es un ejemplo, por lo que voy a generar ids numericos consecutivos, pero en una
	implementacion real no deberian se numeros consecutivos ni nada que genere problemas de seguridad - Hernan"

	lastId := lastId + 1.
	^lastId! !

!TusLibrosSystemFacade methodsFor: 'cart session management' stamp: 'HernanWilkinson 6/22/2013 13:02'!
sessionDuration

	^30 minutes! !

!TusLibrosSystemFacade methodsFor: 'cart session management' stamp: 'HernanWilkinson 6/17/2015 20:50'!
withCartSessionIdentifiedAs: aCartId do: aBlock

	| cartSession |

	cartSession := cartSessions at: aCartId ifAbsent: [self signalInvalidCartId ].
	^cartSession do: aBlock
! !


!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'HAW 11/26/2018 20:18:41'!
add: anAmount of: aBook toCartIdentifiedAs: aCartId

	self withCartSessionIdentifiedAs: aCartId do: [ :cartSession | cartSession addToCart: anAmount of: aBook ]! !

!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'ja 7/7/2021 16:19:01'!
checkOutCartIdentifiedAs: aCartId withCreditCardNumbered: aCreditCartNumber ownedBy: anOwner expiringOn: anExpirationMonthOfYear

	^ self
		withCartSessionIdentifiedAs: aCartId
		do: [ :cartSession | | ticket |
			ticket _ cartSession
			checkOutCartWithCreditCardNumbered: aCreditCartNumber
			ownedBy: anOwner
			expiringOn: anExpirationMonthOfYear.
			ticket ]
! !

!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'HernanWilkinson 6/17/2015 20:52'!
createCartFor: aUser authenticatedWith: aPassword

	^ self if: aUser authenticatesWith: aPassword do: [ | cartId cartSession |

		cartId := self generateCartId.
		cartSession := CartSession ownedBy: aUser with: (Cart acceptingItemsOf: catalog) on: self..
		cartSessions at: cartId put: cartSession.

		cartId  ]! !

!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'HernanWilkinson 6/17/2015 20:48'!
listCartIdentifiedAs: aCartId

	^ self withCartSessionIdentifiedAs: aCartId do: [ :cartSession | cartSession cartContent ]! !

!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'ja 7/7/2021 18:28:01'!
listPurchasesOf: aUser authenticatingWith: aPassword

	^self if: aUser authenticatesWith: aPassword do: [ | sales items total |
		 sales := self salesDoneBy: aUser.
	        items := sales
	            inject: Dictionary new
	            into: [ :quantityByBook :aSale | 
	                self list: aSale on: quantityByBook.
	                quantityByBook ].
	        total := sales sum: [ :aSale | aSale total ] ifEmpty: [ 0 ].
	        items at: 'Total' put: total.
		items ]! !

!TusLibrosSystemFacade methodsFor: 'facade protocol' stamp: 'ja 7/3/2021 16:09:42'!
remove: aBook toCartIdentifiedAs: aCartId
	
	self withCartSessionIdentifiedAs: aCartId do: [ :cartSession | cartSession removeToCart: aBook ]! !


!TusLibrosSystemFacade methodsFor: 'checkout support' stamp: 'HernanWilkinson 6/17/2015 20:49'!
merchantProcessor

	^ merchantProcessor! !

!TusLibrosSystemFacade methodsFor: 'checkout support' stamp: 'HernanWilkinson 6/17/2015 20:50'!
salesBook

	^ salesBook! !


!TusLibrosSystemFacade methodsFor: 'private' stamp: 'ja 7/7/2021 18:27:37'!
list: aSale on: quantityByBook

	"Esto es un indicio de que por ahi conviene empezar a pensar en modelar un SaleBook - Hernan"
	aSale lineItemsDo: [ :aLineItem | | oldQuantity newQuantity |
		oldQuantity := quantityByBook at: aLineItem item ifAbsentPut: [ 0 ].
		newQuantity := oldQuantity + aLineItem quantity.
		quantityByBook at: aLineItem item put: newQuantity ]! !

!TusLibrosSystemFacade methodsFor: 'private' stamp: 'HernanWilkinson 6/17/2015 20:55'!
salesDoneBy: aUser

	"Esto es un indicio de que por ahi conviene empezar a pensar en modelar un SaleBook - Hernan"
	^ salesBook select: [ :aSale | aSale wasDoneBy: aUser ]! !


!TusLibrosSystemFacade methodsFor: 'initialization' stamp: 'HernanWilkinson 6/22/2013 14:17'!
initializeAuthenticatingWith: aValidUsersAndPasswords
	acceptingItemsOf: aCatalog
	registeringOn: aSalesBook
	debitingThrought: aMerchantProcessor
	measuringTimeWith: aClock

	validUsersAndPasswords := aValidUsersAndPasswords.
	catalog := aCatalog.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.
	clock := aClock.

	cartSessions := Dictionary new.
	lastId := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystemFacade class' category: 'TusLibros-Model'!
TusLibrosSystemFacade class
	instanceVariableNames: ''!

!TusLibrosSystemFacade class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/22/2013 14:17'!
authenticatingWith: aValidUsersAndPasswords
	acceptingItemsOf: aCatalog
	registeringOn: aSalesBook
	debitingThrought: aMerchantProcessor
	measuringTimeWith: aClock

	^self new
		initializeAuthenticatingWith: aValidUsersAndPasswords
		acceptingItemsOf: aCatalog
		registeringOn: aSalesBook
		debitingThrought: aMerchantProcessor
		measuringTimeWith: aClock! !
