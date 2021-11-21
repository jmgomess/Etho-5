trigger JogadoresTrigger on Jogador__c  (before insert, before update) {

    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            JogadoresTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }

}