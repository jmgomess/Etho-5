public class AssassinatosHelper {

    public void verificarAssassinato(){

        System.debug('Entrou verificarAssassinato');

        List<Round__c> listaRounds = RoundsSelector.selecionarRoundsEmAndamento();

        System.debug('listaRounds: ' + listaRounds.size());

        if(listaRounds.size() > 0){
            Round__c round = listaRounds.get(0);
            List<Jogador__c> jogadores = round.Jogadores2__r;
            
            if(jogadores.size() >= 2){
                Assassinato__c assassinato = verificarConfronto(jogadores);
                System.debug('assassinato' + JSON.serialize(assassinato));
            }else{
                System.debug('O round tem menos de 2 jogadores vivos');
            }
        }else{
            System.debug('Não tem jogadores vivos no round');
        }  
        
    }

    private Assassinato__c verificarConfronto(List<Jogador__c> jogadores){

        System.debug('Entrou verificarConfronto');

        Assassinato__c assassinato;

        Boolean continuarJogada = true;
        Boolean contraAtaque = false;

        //Selecionar 2 jogadores de forma aleatório
        Jogador__c jogadorAtaque = Utils.obterJogadorAleatorio(jogadores);
        System.debug('jogadorAtaque' + JSON.serialize(jogadorAtaque));

        //TODO remover o jogador para nao duplicar
        //List<Jogador__c> listaAux = jogadores;
        //listaAux.remove(jogadorAtaque)

        Jogador__c jogadorDefesa = Utils.obterJogadorAleatorio(jogadores);
        System.debug('jogadorDefesa' + JSON.serialize(jogadorAtaque));

        Jogador__c jogadorContraAtaqueAux;

        while (continuarJogada){
            //Trocar a posicao dos jogadores
            if(contraAtaque){
                jogadorContraAtaqueAux = jogadorAtaque;+
                jogadorAtaque = jogadorDefesa;
                jogadorDefesa = jogadorContraAtaqueAux;
            }

            Integer jogadaAtaque = Utils.jogarDado(20);
            System.debug('jogadaAtaque' + JSON.serialize(jogadaAtaque));
            // (1D20 + FORÇA)
            Integer totalAtaque = jogadaAtaque + Integer.valueOf(jogadorAtaque.Forca__c);
            System.debug('totalAtaque' + JSON.serialize(totalAtaque));
            //(2D10 + INTELIGENCIA + VELOCIDADE)
            Integer totalDefesa = Utils.jogarDado(10) + Utils.jogarDado(10) + Integer.valueOf(jogadorDefesa.Inteligencia__c) + Integer.valueOf(jogadorDefesa.Velocidade__c);
            System.debug('totalDefesa' + JSON.serialize(totalDefesa));

            if(totalAtaque > totalDefesa){
                System.debug('totalAtaque maior que defesa');
                assassinato = obterAssassinato(jogadorAtaque, jogadorDefesa);
                continuarJogada = false;
            }else{
                System.debug('totalAtaque menor que defesa');
                if(jogadaAtaque == 1 && !contraAtaque){
                    //Contra-ataque
                    //- Caso o assassino tire 1, o assassinado tem a chance de assassinar
                    //- Não existe contra-golpe de contra-golpe
                    System.debug('contra-ataque');
                    contraAtaque = true;
                }else{
                    continuarJogada = false;
                    System.debug('Não teve vencedor');
                }

            }
        
        }

        return assassinato;

    }

    private Assassinato__c obterAssassinato(Jogador__c jogadorAtaque, Jogador__c jogadorDefesa){
        Assassinato__c assassinato = new Assassinato__c();
        assassinato.Assassino__r = jogadorAtaque;
        assassinato.Assassinado__r = jogadorDefesa;
        return assassinato;
    }

}