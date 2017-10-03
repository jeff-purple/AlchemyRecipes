@isTest
public class AB_TestDataFactory {

//Route__c
	public static List<Route__c> createRoutes(Integer numberOfRoutes, Boolean doInsert) {
		List<Route__c> routeList = new List<Route__c>();
		for ( Integer i = 0 ; i < numberOfRoutes ; i++ ) {
			Route__c route = new Route__c(	WSLRNbrRouteNbr__c       = '43100R0N00'+string.valueof(i),
											StartOrderNbr__c         = 105000+i,
											EndOrderNbr__c           = 105999+i,
											Strike_Rate_Adherence__c = math.random() * 100,
											Tapwiser_Adherence__c    = math.random() * 100,
											Call_Route_Adherence__c  = math.random() * 100);
			routeList.add(route);
		}
		if (doInsert == TRUE){
			insert routeList;
		}
		return routeList;	
	}

//Event
	public static List<Event> createEventsSubject(Integer numberOfEvents, String eventSubject, Boolean doInsert) {

		List<Event> eventList = new List<Event>();

		for ( Integer i = 0 ; i < numberOfEvents ; i++ ) {

							if(eventSubject == Null){
			eventSubject = 'test '+ string.valueof (i);
		}

			Event event = new Event(Subject          = eventSubject,
									Description      = 'This is a test description for event # ' +string.valueof(i),
									Location         = 'Building # ' +string.valueof(i),
									Type             = 'Other',
									EndDateTime      = system.now()+(1+i),
									ActivityDateTime = system.now()+i,
									IsAllDayEvent    = false);
			eventList.add(event);
		}
		if (doInsert == TRUE){
			insert eventList;
		}
		return eventList;	
	}

//User
	public static List<User> createUsers(Integer numberOfUsers, String profileName, String roleName, Boolean doInsert) {

	UserRole uRole;
	Profile profile;

		if (roleName != null)
			{uRole = [SELECT Id, UserRole.Name FROM UserRole WHERE UserRole.Name = :roleName LIMIT 1]; //get role
			} else {uRole = [SELECT Id FROM UserRole LIMIT 1]; //random role
			}

		if (profileName != null)
			{profile = [SELECT Id FROM Profile WHERE Name = :profileName LIMIT 1]; //get profile
			} else {profile = [SELECT Id FROM Profile LIMIT 1]; //random profile}
			}


		List<User> userList = new List<User>();
		for ( Integer i = 0 ; i < numberOfUsers ; i++ ) {
			User user = new User(	UserName             = string.valueof(math.random() * 100)+'testuser'+math.random()+string.valueof(i)+'@salesforce.com',
									FirstName            = 'test',
									LastName             = 'user '+string.valueof(i),
									Title                = 'Sales Representative', 
									UserRole             = uRole, 
									IsActive             = True, 
									Profileid            = profile.id,
									Email                = 'test'+string.valueof(i)+'@salesforce.com',
									MobilePhone          = '999-999-9999',
									Phone                = '999-999-9999',
									TimeZoneSidKey       = 'America/Chicago',
									Wholesaler_Number__c = '4310'+string.valueof(i), 
									WSLRNbrRouteNbr__c   = '43100R0N00'+string.valueof(i),
									LocaleSidKey         = 'en_US',
									LanguageLocaleKey    = 'en_US',
									Alias                = string.valueof(i)+'test',
									EmailEncodingKey     = 'UTF-8');
			userList.add(user);
		}
		if (doInsert == TRUE){
			insert userList;
		}
		return userList;	
	}

//Route_Sales_Volume__c
	public static List<Route_Sales_Volume__c> createRouteSalesVolumes(Integer numberOfRSVs, Id routeId, Boolean doInsert) {

		List<Route_Sales_Volume__c> rsvList = new List<Route_Sales_Volume__c>();
		for ( Integer i = 0 ; i < numberOfRSVs ; i++ ) {
			
String nextMonth;
if(system.today().month()+i>10){
					nextMonth = string.valueof((system.today().month()+i));
					} else {nextMonth = string.valueof(0)+string.valueof((system.today().month()+i));
					}

			Route_Sales_Volume__c rsv = new Route_Sales_Volume__c(  Name                          = 'test '+string.valueof(i),
																	Actual_Pending_Volume__c      = 2000+i,
																	Actual_Volume__c              = 1000+i,
																	Brand_Group__c                = 'ABI-Brand #'+string.valueof(i),
																	Period__c                     = string.valueof(system.today().year())+nextMonth,
																	Remaining_Selling_Days__c     = 20,
																	Route__c                      = routeId, 
																	Route_Number__c               = '43100'+string.valueof(i),
																	Selling_Days_in_Month__c      = 25,
																	Target_Volume__c              = 2500,
																	Wholesaler_Number_Main__c     = 'R0N00'+string.valueof(i), 
																	Wholesaler_Number_Location__c = 'R0N00'+string.valueof(i), 
																	External_ID__c                = 'R0N00'+string.valueof(i) + '43100'+string.valueof(i) + 'ABI-Brand #'+string.valueof(i) + string.valueof(system.today().year()+(system.today().month()+(i))));
			rsvList.add(rsv);
		}
		if (doInsert == TRUE){
			insert rsvList;
		}
		return rsvList;	
	}

//Contact
	public static List<Contact> createContacts(Integer numberOfContacts, String recordTypeName, Boolean doInsert) {

	Id recType = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('NAZ User').getRecordTypeId();
	if(recordTypeName != NULL){
	recType = Schema.SObjectType.Contact.getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
	} 

		List<Contact> contactList = new List<Contact>();
		for ( Integer i = 0 ; i < numberOfContacts ; i++ ) {
			Contact contact = new Contact(	FirstName        = 'test', 
											LastName         = 'Contact #'+string.valueof(i), 
											Role_Picklist__c = 'Sales Rep',
											Email            = 'test'+string.valueof(i)+'@salesforce.com', 
											RecordTypeId     = recType);
			contactList.add(contact);
		}
		if (doInsert == TRUE){
			insert contactList;
		}
		return contactList;	
	}

//RouteCust__c
	public static List<RouteCust__c> createRouteCusts(Integer numberOfRouteCusts, Boolean doInsert) {

		List<RouteCust__c> routeCustList = new List<RouteCust__c>();
		for ( Integer i = 0 ; i < numberOfRouteCusts ; i++ ) {
			RouteCust__c routeCust = new RouteCust__c();
			routeCustList.add(routeCust);
		}
		if (doInsert == TRUE){
			insert routeCustList;
		}
		return routeCustList;	
	}

//Account
	public static List<Account> createAccounts(Integer numberOfAccounts, String recordTypeName, Boolean doInsert) {
	
	Id recType;
	
	if(recordTypeName == Null){
			recordTypeName = 'Wholesaler';
		}
	if(!string.isempty(recordTypeName)){	
	recType = Schema.SObjectType.Account.getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
	} 
		List<Account> accountList = new List<Account>();

		for ( Integer i = 0 ; i < numberOfAccounts ; i++ ) {
			Account account = new Account(	RecordTypeId = recType, 
											Name         = 'test'+string.valueof(i));
			accountList.add(account);
		}
		if (doInsert == TRUE){
			insert accountList;
		}
		return accountList;	
	}

//Route_Schedule__c
	public static List<Route_Schedule__c> createRouteSchedules(Integer numberOfRteSchedules, Boolean doInsert) {

		List<Route_Schedule__c> rteScheduleList = new List<Route_Schedule__c>();

		for ( Integer i = 0 ; i < numberOfRteSchedules ; i++ ) {
			Route_Schedule__c rteSchedule = new Route_Schedule__c(WSLRNbrRouteNbr__c = '43100R0N00'+string.valueof(i));
			rteScheduleList.add(rteSchedule);
		}
		if (doInsert == TRUE){
			insert rteScheduleList;
		}
		return rteScheduleList;	
	}

//ONTAP__Order__c
	public static List<ONTAP__Order__c> createOnTapOrders(Integer numberOfOnTapOrders, Boolean doInsert) {

		List<ONTAP__Order__c> onTapOrdersList = new List<ONTAP__Order__c>();

		for ( Integer i = 0 ; i < numberOfOnTapOrders ; i++ ) {
			ONTAP__Order__c onTapOrder = new ONTAP__Order__c();
			onTapOrdersList.add(onTapOrder);
		}
		if (doInsert == TRUE){
			insert onTapOrdersList;
		}
		return onTapOrdersList;	
	}
}