public without sharing class JogadoresTriggerHandler {
   
    public static void beforeUpdate (List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        for (Jogador__c jogador : records) { //realiza uma iteração
            beforeUpdate(jogador, oldMap.get(jogador.Id));
      }
    }

    private static void beforeUpdate(Jogador__c record, Jogador__c recordOld) {
        
        if (ehJogadorPdrao(record)) {
            if (foiEliminado(record, recordOld)) {

            }
        }


        if (!ehmembroStaff(record.RecordTypeId)) {
            
            if (foi eliminado) {
                //morreu
                    //popula data da morte
                    //marca morreu como true
            }
        } else { //e membro do staff
            if (morreu()) {
                //foi eliminado
                    //popula data da morte
                    //marca eliminado como true
            }
        }
        
       /* if (naoemembrodostaff) {
            if (foi eliminado) {
                //morreu
                    //popula data da morte
                    //marca morreu como true
            }
        } else { //e membro do staff
            if (morreu()) {
                //foi eliminado
                    //popula data da morte
                    //marca eliminado como true
            }
        }
        */

        if (isChanged(record, recordOld, Jogador__c.Eliminado__c)) {
            setValue(record, Jogador__c.DataMorte__c, System.now());
        }
    }

    private static Boolean isChanged(Jogador__c record, Jogador__c recordToCompare, Schema.SObjectField field) {
        return isChanged(record.get(fieldToEvaluate), recordToCompare.ge(fieldToEvaluate));
    }

    private static Boolean isChanged(Boolena value, Boolean valueToCompare) {
        return value != valueToCompare;
    }

    private static void serValue(Jogador__c record, Schema.SObjectField field, Object value) {
        record.put(field, value);
    }

    private static Id ehJogadorPadrao(Jogador__c record) {
        return true;
    }



}
