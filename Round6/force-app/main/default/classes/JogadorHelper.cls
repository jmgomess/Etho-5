public class JogadorHelper {

    public static void elimiarJogador(Jogador__c jogadorEliminado){
        jogadorEliminado.Eliminado__c = true;
        jogadorEliminado.Morreu__c = true;
        jogadorEliminado.DataMorte__c = System.now();
    
        System.debug('elimiarJogador: ' + JSON.serialize(jogadorEliminado));
        update jogadorEliminado;
    }

}
