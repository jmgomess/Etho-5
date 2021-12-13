public with sharing class CandidatosSelector {
    public static String getQueryLocatorCEPBatchable() {
        return 'SELECT Id, Name FROM Candidato__c WHERE CEPAlterado__c = true ORDER BY Name ASC';
    }
}
