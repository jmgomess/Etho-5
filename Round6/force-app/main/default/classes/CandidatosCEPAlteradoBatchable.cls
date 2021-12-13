public without sharing class CandidatosCEPAlteradoBatchable implements Database.Batchable<sObject>, Database.Stateful {
    
    String error;

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(CandidatosSelector.getQueryLocatorCEPBatchable());
    }
  
    //TODO: atualizar o campo CEPAlterado__c para FALSE
    public void execute(Database.BatchableContext BC, List<Candidato__c> scope) {
        for (Candidato__c record : scope) {
            record.CEPAlterado__c = false;
            error += record.Id + ' - ';
        }
    }
  
    public void finish(Database.BatchableContext BC) {
        System.debug('error: ' + error);
    }
}