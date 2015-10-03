public class Number9 {
    
    void method1(){
        //A runtime exception is thrown if this query returns enough records to exceed your heap limit.
        Account[] accts = [SELECT id FROM account];
        for(Account a : accts){
            //do logic
        }
    }
    
    void method2(){    
        // Use this format for efficiency
        for (List<Account> acct: [SELECT id, name FROM account WHERE name LIKE 'Acme']){
            for(Account a : acct){
                //do logic
            }
        }
        
    }
}