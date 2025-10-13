public with sharing class UserController {
    
    // Fetch all users
    @AuraEnabled(cacheable=true)
    public static List<User__c> getUsers() {
        return [
            SELECT Id, Full_Name__c, Age__c, Contact_Number__c, Email_Address__c,
                   Medical_History__c, Health_Issues__c, Consultation_Time__c
            FROM User__c
        ];
    }

    // Create a new user
    @AuraEnabled
    public static User__c createUser(User__c user) {
        insert user;
        return user;
    }

    // Update existing user
    @AuraEnabled
    public static User__c updateUser(User__c user) {
        update user;
        return user;
    }

    // Delete a user
    @AuraEnabled
    public static void deleteUser(Id userId) {
        delete [SELECT Id FROM User__c WHERE Id = :userId];
    }
    
    // Fetch all nutritionists
    @AuraEnabled(cacheable=true)
    public static List<Nutritionist__c> getNutritionists() {
        return [
            SELECT Id, Nutritionists_Name__c, Specialization__c, Note__c
            FROM Nutritionist__c
        ];
    }
}
