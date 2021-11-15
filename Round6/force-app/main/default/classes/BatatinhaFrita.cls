public class BatatinhaFrita implements IPartida {
    public void execute(Id idPartida)
    {
        ParticipantesPartida__c[] participantes = [SELECT Jogador__c FROM ParticipantesPartida__c WHERE Partida__c = :idPartida];
        System.debug(participantes);
        Jogador__c[] jogadores = new List<Jogador__c>();
        
        Integer mortes = (Integer) participantes.size() / 2;
        
        for(Integer i = 0; i < mortes; i++)
        {
            Jogador__c jogador = new Jogador__c();
            jogador.Id = participantes[i].Jogador__c;
            jogador.Eliminado__c = true;
            jogadores.add(jogador);
        }
        
        update jogadores;
        
        Partida__c partida = new Partida__c(Id = idPartida, TerminoPartida__c = System.now());
        //update new Partida__c(Id = idPartida, TerminoPartida__c = System.now());
        
        update partida;
    }
}