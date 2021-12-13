public with sharing class CandidatoCEPController {

    @AuraEnabled
    public static Candidato__c saveRecord(String recordId, String cep) {
        Candidato__c c = new Candidato__c(Id = Id.valueOf(recordId));
        c.CEP__c = cep;

        try {
            update c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return c;
    }
}
