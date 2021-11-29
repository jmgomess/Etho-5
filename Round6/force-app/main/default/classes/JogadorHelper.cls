public class JogadorHelper {

    public static void elimiarJogador(Jogador__c jogadorEliminado){

        //TODO so marcar o morreu pq vai entrar na trigger after e before de jogador (ver codigo do Arthur)
        jogadorEliminado.Eliminado__c = true;
        jogadorEliminado.Morreu__c = true;
        jogadorEliminado.DataMorte__c = System.now();
    
        System.debug('elimiarJogador: ' + JSON.serialize(jogadorEliminado));
        update jogadorEliminado;
    }

}
