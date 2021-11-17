public without sharing class JogadoresTriggerHandler {
   
    public static void beforeUpdate (List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        
        for (Jogador__c jogador : Trigger.new) { //realiza uma iteração
            Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);  //atribuição

            if (!jogadorOld.Eliminado__c && jogador.Eliminado__c) {//verifica 2 condições                
                jogador.DataMorte__c = System.now(); //atribuição
            }

        }

    }

}
