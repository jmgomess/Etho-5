public without sharing class RoundsSelector {

    public static List<Round__c> selectByRoundsIdsWithJogadores(Set<Id> ids) {
        return [
            //Criar PremioTotal__c nao tem na org
           // SELECT  Id, TotalJogadoresEliminados__c, PremioTotal__c,
           SELECT  Id, TotalJogadoresEliminados__c, Premio__c,
                    (
                        SELECT Id, ValorPagar__c, RecordTypeId, RecordType.DeveloperName, Candidato__r.Email__c
                        FROM Jogadores2__r 
                        WHERE Eliminado__c = true
                    )
            FROM Round__c 
            WHERE Id IN :ids
        ];
    }

    public static List<Round__c> selectAllRoundsWithJogadores() {
        return [
            SELECT  Id, Name, TotalJogadoresEliminados__c, PremioTotal__c,
                    (
                        SELECT Id, Nick__c, Candidato__r.Name
                        FROM Jogadores2__r 
                        WHERE Eliminado__c = true
                    )
            FROM Round__c
        ];
    }

	public static List<Round__c> selectRoundsByIdStatusJogadoresVivos(Set<Id> roundsIds, Set<String> statusList) {
        return [
            SELECT 
                Id,
                Vencedor__c,
                (SELECT Id FROM Jogadores2__r WHERE Eliminado__c = false)
            FROM Round__c
            WHERE 
                    Id = :roundsIds          
                AND Status__c IN :statusList
        ];
    }
	
    public static List<Round__c> selectAllRoundsWithJogadoresNaoEliminados() {
        return [
            SELECT                      //Criar no meu objeto
                Id, Name, Vencedor__c, //PremioTotal__c,
                (SELECT 
                    Id, Name, QuantidadeAssassinatos__c, Candidato__r.Name, Morreu__c, Forca__c, Velocidade__c, Inteligencia__c
                    FROM Jogadores2__r 
                    WHERE RecordTypeId = :Schema.SObjectType.Jogador__c.getRecordTypeInfosByDeveloperName().get(Label.RECORD_TYPE_DEVELOPER_NAME_JOGADOR_PADRAO).getRecordTypeId())
            FROM Round__c
            WHERE Status__c = 'Em Andamento'
        ];
    }
	
    //TODO arrumar o nome do select, parametrizar
    public static List<Round__c> selecionarRoundsEmAndamento() {
        return [
            SELECT 
                Id,
                (SELECT Id, Forca__c, Inteligencia__c, Velocidade__c FROM Jogadores2__r WHERE Eliminado__c = false)
            FROM Round__c
            WHERE Status__c = 'Em Andamento'
           // LIMIT 1
        ];
    }

}