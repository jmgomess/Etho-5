public without sharing class AssassinatosHandler {

    public AssassinatosHandler() {

        List<Round__c> listaRounds = RoundsSelector.selectRoundsEmAndamento();

        if(listaRounds.size() > 0){
           
            Round__c round = listaRounds.get(0);
            List<Jogador__c> jogadores = round.getJogarores();
           
            if(jogadores.size() >= 2){

                booelan continuarJogada = true;
                boolean contraAtaque = false;

                //Selecionar 2 jogadores de forma aleatório
                Jogador__c jogadorAtaque = Utils.obterJogadorAleatorio(jogadores);
                List<Jogador__c> listaAux = jogadores;
                Jogador__c jogadorDefesa = Utils.obterJogadorAleatorio(listaAux.remove(jogadorAtaque));

                Jogador__c jogadorContraAtaqueAux;

                while (continuarJogada){

                    //Trocar a posicao dos jogadores
                    if(contraAtaque){
                        jogadorContraAtaqueAux = jogadorAtaque;+
                        jogadorAtaque = jogadorDefesa;
                        jogadorDefesa = jogadorContraAtaqueAux;
                    }

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

                        continuarJogada = false;
                        //break;

                    }else{

                        if(jogadaAtaque == 1 && !contraAtaque){
                            //Contra-ataque
                            //- Caso o assassino tire 1, o assassinado tem a chance de assassinar
                            //- Não existe contra-golpe de contra-golpe
                            
                            contraAtaque = true;
                            //continue;

                        }else{
                            continuarJogada = false;
                            System.debug('Não teve vencedor');
                            //break;
                        }

                    }
                
                }

            }else{
                System.debug('O round tem menos de 2 jogadores vivos');
            }
              
        }else{
            System.debug('Não tem jogadores vivos no round');
        }  
      
    }

}
