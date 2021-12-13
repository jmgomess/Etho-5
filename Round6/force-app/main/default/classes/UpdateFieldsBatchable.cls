public with sharing class UpdateFieldsBatchable implements Database.Batchable<sObject>, Database.Stateful {
    
    String query;
    Map<SObjectField, Object> mapa;

    public UpdateFieldsBatchable(String query, Map<SObjectField, Object> mapa) {
        this.query = query;
        this.mapa = mapa;
    }

    public Database.QueryLocator start(Database.BatchaBleContext BC) {
        System.debug('PASSOU Database.QueryLocator');
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        System.debug('ENTROU execute');
        System.debug('SCOPE: ' + JSON.serialize(scope));

        for (SObject record : scope) {
            //JSON.serialize(record.getPopulatedFieldsAsMap());
            for (Schema.SOBjectField key : mapa.keySet()) {
                record.put(key, mapa.get(key));
            }
        }

        //update scope;

        /*for (Integer i = 0; i < mapSize; i++) {


            SObject objeto = scope.get(i);
            Schema.SObjectField field = ;

            objeto.put(), arg1)
        }*/
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('PASSOU finish');
        //sendLog();
    }
}