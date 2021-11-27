public without sharing class AssassinatosHandler {

    public AssassinatosHandler() {

        List<Round__c> listaRounds = RoundsSelector.selectRoundsEmAndamento();

        if(listaRounds.size() > 0){
            Round__c round = listaRounds.get(0);
            List<Jogador__c> jogadores = round.getJogarores();
           
            if(jogadores.size() >= 2){

            //Selecionar 2 jogadores de forma aleatório
            Jogador__c jogadorAtaque = obterJogadorAleatorio(jogadores);
            List<Jogador__c> listaAux = jogadores;
            listaAux.remove(jogadorAtaque);
            Jogador__c jogadorDefesa = obterJogadorAleatorio(listaAux);

            Integer jogadaAtaque = Utils.jogarDado(20);
            Integer totalAtaque = jogadaAtaque + jogadorAtaque.Forca__c;
            Integer totalDefesa = Utils.jogarDado(10) + Utils.jogarDado(10) + jogadorDefesa.Inteligencia__c + jogadorDefesa.Velocidade__c;
            
            if(totalAtaque > totalDefesa){
            //   - Para o assassino vencer: 
            //   (1D20 + FORÇA) > (2D10 + INTELIGENCIA + VELOCIDADE)
            //      Assassino                 Assassinado   

              Assassinato__c assassinato = new Assassinato__c();
              assassinato.Assassino__c = jogadorAtaque;
              assassinato.Assassinado__c = jogadorDefesa;
            }else{

                if(jogadaAtaque == 1){
                //Contra-ataque
                //- Caso o assassino tire 1, o assassinado tem a chance de assassinar
                //        (1D20 + FORÇA) > (2D10 + INTELIGENCIA + VELOCIDADE)
                //    - Não existe contra-golpe de contra-golpe




                }else{
                    System.debug('Não teve vencedor');
                }

            }

            }else{
                System.debug('Temos apenas 1 jogador vivo');
            }
        }else{
            System.debug('Não tem jogadores vivos no round');
        }
       
    }

    private static Jogador__c obterJogadorAleatorio(List<Jogador__c> jogadores){
        return jogadores.get(Integer.valueof((Math.random() * jogadores.size())));
    }

}
