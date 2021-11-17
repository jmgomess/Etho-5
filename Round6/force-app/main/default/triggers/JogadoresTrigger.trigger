trigger JogadoresTrigger on Jogador__c (before update) {

    //System.debug('TRIGGER FOI ACIONADA!!');

    //Versã0 1
    if (Trigger.isBefore) {
        //if (Trigger.isInsert) {
         //   System.debug('BEFORE INSERT');
       // }
        if (Trigger.isUpdate) {
           // System.debug('BEFORE UPDATE');

            JogadoresTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    
}