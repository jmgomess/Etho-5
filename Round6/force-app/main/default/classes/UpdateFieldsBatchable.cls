public with sharing class UpdateFieldsBatchable implements Database.Batchable<sObject>, Database.Stateful {
    
    String query = 'SELECT Id, Name, TerminoJogos__c, InicioJogos__c FROM Round__c WHERE Id in :id';
    Map<SObjectField, Object> mapa;

    public UpdateFieldsBatchable(String query, Map<SObjectField, Object> mapa) {
        this.query = query;
        this.mapa = mapa;
    }

    public Database.QueryLocator start(Database.BatchaBleContext BC) {
        System.debug('Metodo Database.QueryLocator');
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        System.debug('Metodo execute');
        System.debug('SCOPE: ' + JSON.serialize(scope));

        for (SObject record : scope) {
            //JSON.serialize(record.getPopulatedFieldsAsMap());
            for (Schema.SOBjectField key : mapa.keySet()) {
                record.put(key, mapa.get(key));
            }
        }

        //update scope;

    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Metodo finish');
        //sendLog();
    }

    
}