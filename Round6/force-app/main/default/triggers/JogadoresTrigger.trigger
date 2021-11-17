trigger JogadoresTrigger on Jogador__c (before update) {

    //System.debug('TRIGGER FOI ACIONADA!!');

    //Versã0 1
    if (Trigger.isBefore) {
        //if (Trigger.isInsert) {
         //   System.debug('BEFORE INSERT');
       // }
        if (Trigger.isUpdate) {
            System.debug('BEFORE UPDATE');

           // List<Jogador__c> registrosAtualizados = (List<Jogador__c>) Trigger.new;

            for (Jogador__c jogador : Trigger.new) {
                Jogador __c jogadorOld = Trigger.oldMap.get(jogador.Id);

                if (!jogadorOld.Eliminado__c && jogador.Eliminado__c) {
                    jogador.DataMorte__c = System.now();
                }

            }

        }
    }
    
}