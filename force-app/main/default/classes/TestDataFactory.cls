@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
    public static List<Account> getAccounts(Integer numAccounts){
        List<Account> actList = new List<Account>();
        for(Integer i=0; i<numAccounts; i++){
            Account act = new Account();
            act.Name = 'TestAccount' + i;
            actList.add(act);
        }
        return actList;
    }
    public static B2B_Customer_Delivery_Date__c getPreferredDeliveryDay(Id accountId, String dayVar){
        B2B_Customer_Delivery_Date__c preferredDeliveryDay = new B2B_Customer_Delivery_Date__c();
        preferredDeliveryDay.Customer__c = accountId;
        preferredDeliveryDay.Day__c = dayVar;
        return preferredDeliveryDay;
    }
    public static List<product2> getProducts(Integer numProducts){
        List<product2> productList = new List<product2>();
        for(Integer i=0; i<numProducts ; i++){
            product2 productVar = new product2();
            productVar.Name = 'TestProduct' + i;
            productVar.IsActive = true;
            productList.add(productVar);
        }
        return productList;
    }
    public static List<Order_Grid__c> getOrderGrids(Map<Id,List<product2>> accountWithProductMap){
        List<Order_Grid__c> orderGrids = new List<Order_Grid__c>();
        for(Id actId: accountWithProductMap.keySet()){
            for(product2 productVar :accountWithProductMap.get(actId)){
                Order_Grid__c grid = new Order_Grid__c();
                grid.Account_Name__c = actId;
                grid.Product__c = productVar.Id; 
                orderGrids.add(grid);
            }
        }
        
        return orderGrids;
    }

    public static OrderDeliveryMethod getOrderDeliveryMethod(){
        OrderDeliveryMethod OrderDeliveryMethodVar = new OrderDeliveryMethod();
        OrderDeliveryMethodVar.Name = 'Standard Delivery Method';
        return OrderDeliveryMethodVar;
    }
    public static BuyerGroup getBuyerGroup(){
        return new BuyerGroup(name = 'TestBuyerGroup');
    }
    public static BuyerGroupMember getBuyerGroupMember(Id buyerGroupId, Id buyerId){
        return new BuyerGroupMember(BuyerId = buyerId, BuyerGroupId =buyerGroupId);
    }
    public static BuyerAccount getBuyerAccount(Id actRecordId){
        return new BuyerAccount(BuyerId = actRecordId, IsActive= true, Name= 'TestName');
    }
    public static webStore getWebStore(){
        return new webStore(name = 'TestName');
    }
    public static WebStoreBuyerGroup getWebStoreBuyerGroup(Id webStoreId, Id BuyerGroupId){
        return new WebStoreBuyerGroup(WebStoreId = webStoreId, BuyerGroupId = BuyerGroupId);
    }
    
    public static Site__c getSite(String name){
        Site__c testSite = new Site__c();
        testSite.Name = name;
        testSite.BHC__c = 'Manildra';
        testSite.Phone__c = '123456789';
        testSite.Address__c = 'Test Address';
        return testSite;
    }
    
    public static Operation_Hours__c getOperationHours(Id siteId){
        Operation_Hours__c testOpHours = new Operation_Hours__c();
        testOpHours.Site__c = siteId;
        return testOpHours;
    }
    
    public static Grain_Price__c getGrainPrice(Id siteId){
        Grain_Price__c grainPrice = new Grain_Price__c();
        grainPrice.Site__c = siteId;
        return grainPrice;
    }

    public static Grain_Price__c getGrainPrice(Id siteId, String binGrade){
        Grain_Price__c grainPrice = new Grain_Price__c();
        grainPrice.Site__c = siteId;
        grainPrice.Bin_Grade__c = binGrade;
        return grainPrice;
    } 
    
    public static Lead getLead(){
        Lead testLead = new Lead();
        testLead.LastName = 'test Lead';
        testLead.Business_Type__c = 'Bakery';
        testLead.Company = 'test Lead Company';
        testLead.Buyer_Group__c = 'Bakers Delight';
        return testLead;
    }
}