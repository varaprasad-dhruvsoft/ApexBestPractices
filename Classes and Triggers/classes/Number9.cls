public class Number9 {
    
    void method1(){
        //A runtime exception is thrown if this query returns enough records to exceed your heap limit.
        Account[] accts = [SELECT id FROM account];
        for(Account a : accts){
            //do logic
        }
    }
    
    
}