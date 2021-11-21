public without sharing class RoundsTriggerHandler {    

    public static void afterUpdate(List<Round__c> records, Map<Id, Round__c> oldMap) {
        Map<Id, Round__c> recordsWithJogadoresMap = new Map<Id, Round__c>(RoundsSelector.selectByRoundsIdsWithJogadores(oldMap.keySet()));
        List<Jogador__c> jogadoresToUpdate = new List<Jogador__c>();

        for (Round__c record : records) {
            afterUpdate(record, oldMap.get(record.Id), recordsWithJogadoresMap.get(record.Id).Jogadores__r, jogadoresToUpdate);
        }

        update jogadoresToUpdate;
    }

    private static void afterUpdate(Round__c record, Round__c recordOld, List<Jogador__c> jogadoresRound, List<Jogador__c> jogadoresToUpdate) {
        handleSuspensao(record, recordOld, jogadoresRound, jogadoresToUpdate);
    }

    //TODO: não pagar família de membro do staff e cálculo não deverá considerá-lo como um jogador
    //Se o campo Premio__c está considerando esse filha da puta, o campo tá errado
    //Se o campo TotalJogadoresEliminados__c está considerando esse filho da puta também, o campo tb tá errado
    //MAS, tentem resolver essa pica SOMENTE usando código
    private static void handleSuspensao(Round__c record, Round__c recordOld, List<Jogador__c> jogadoresRound, List<Jogador__c> jogadoresToUpdate) {
        if (roundFinalizadoPorSuspensao(record.Status__c, recordOld.Status__c)) {
            setValorPagarMortos((record.Premio__c/record.TotalJogadoresEliminados__c), jogadoresRound);
            jogadoresToUpdate.addAll(jogadoresRound);
        }
    }

    private static Boolean roundFinalizadoPorSuspensao(String status, String statusOld) {
        //TODO: essa merda aqui
        return true;
    }

    private static void setValorPagarMortos(Decimal valorPagar, List<Jogador__c> jogadoresRound) {
        for (Jogador__c jogador : jogadoresRound) {
            jogador.ValorPagar__c = valorPagar;
        }
    }


}
