public with sharing class UpdateFieldsBatchableMain {

    public UpdateFieldsBatchableMain() {

        /*Map<Schema.SObjectField, Object> fieldsValuesMap1 = new Map<Schema.SObjectField, Object> {
            Account.Name => 'Name',
            Account.BillingState => 'RJ'
        };*/

        /*Map<Schema.SObjectField, Object> fieldsValuesMap2 = new Map<Schema.SObjectField, Object> {
            Candidato__c.CEPAlterado__c => false,
            Candidato__c.Email__c => 'ma@oie.com'
        };*/

        Map<Schema.SObjectField, Object> fieldsValuesMap = new Map<Schema.SObjectField, Object> {
            Round__c.Name => 'Round-00001',
            Round__c.TerminoJogos__c => Datetime.now().date(),
            Round__c.InicioJogos__c => Datetime.now().date()
        };

        Set<Id> id = new Set<Id>{'a045f000003YVlEAAW'};

        //String query = 'SELECT Aceite__c, Bairro__c, Celular__c, CEPAlterado__c FROM Candidato__c';
        String query = 'SELECT Id, Name, TerminoJogos__c, InicioJogos__c FROM Round__c WHERE Id in :id';


        Database.executeBatch(new UpdateFieldsBatchable(query, fieldsValuesMap), 1);

        /*for (Schema.SObjectField field : fieldsValuesMap1.keySet()) {
            System.debug('FIELD: ' +  field);
        }

        for (Object value : fieldsValuesMap1.values()) {
            System.debug('VALORES: ' + value);
        }*/
    }
}
