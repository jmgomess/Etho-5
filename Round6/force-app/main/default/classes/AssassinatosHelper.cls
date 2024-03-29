public class AssassinatosHelper {

    public void verificarAssassinato(){

        System.debug('Entrou verificarAssassinato');

        List<Round__c> listaRounds = RoundsSelector.selecionarRoundsEmAndamento();

        System.debug('listaRounds: ' + listaRounds.size());

        if(!listaRounds.isEmpty()){
            Round__c round = listaRounds.get(0);
            List<Jogador__c> jogadores = round.Jogadores2__r;
            
            if(jogadores.size() >= 2){
                verificarConfronto(jogadores);
                System.debug('Finalizou verifica confronto');
            }else{
                System.debug('O round tem menos de 2 jogadores vivos');
            }
        }else{
            System.debug('Não tem jogadores vivos no round');
        }  
        
    }

    private void verificarConfronto(List<Jogador__c> jogadores){

        System.debug('Entrou verificarConfronto');

        Boolean continuarJogada = true;
        Boolean contraAtaque = false;

        //Selecionar 2 jogadores de forma aleatório
        Jogador__c jogadorAtaque = selecionarJogador(jogadores, null);
        System.debug('jogadorAtaque ' + JSON.serialize(jogadorAtaque));

        Jogador__c jogadorDefesa = selecionarJogador(jogadores, jogadorAtaque);
        System.debug('jogadorDefesa ' + JSON.serialize(jogadorDefesa));

        Jogador__c jogadorContraAtaqueAux;

        while(continuarJogada){
            //Trocar a posicao dos jogadores
            if(contraAtaque){
                jogadorContraAtaqueAux = jogadorAtaque;
                jogadorAtaque = jogadorDefesa;
                jogadorDefesa = jogadorContraAtaqueAux;
            }

            Integer jogadaAtaque = Utils.jogarDado(20);
            //Teste jogada ataque = 1
            //jogadaAtaque = 1;
            System.debug('jogadaAtaque ' + JSON.serialize(jogadaAtaque));
            

            // (1D20 + FORÇA)
            Integer totalAtaque = jogadaAtaque + Integer.valueOf(jogadorAtaque.Forca__c);

            System.debug('totalAtaque ' + JSON.serialize(totalAtaque));
            
            //(2D10 + INTELIGENCIA + VELOCIDADE)
            Integer totalDefesa = Utils.jogarDado(10) + Utils.jogarDado(10) + Integer.valueOf(jogadorDefesa.Inteligencia__c) + Integer.valueOf(jogadorDefesa.Velocidade__c);
            System.debug('totalDefesa ' + JSON.serialize(totalDefesa));

            if(totalAtaque > totalDefesa){
                System.debug('totalAtaque maior que defesa');
                JogadorHelper.elimiarJogador(jogadorDefesa);
                salvarAssassinato(jogadorAtaque, jogadorDefesa);
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

    }

    private Jogador__c selecionarJogador(List<Jogador__c> jogadores, Jogador__c jogadorExistente){

        System.debug('Entrou selecionarJogador');

        Jogador__c novoJogador = Utils.obterJogadorAleatorio(jogadores);
        Boolean selecionarJogador = true;

        //Teste duplicidade de jogador
        /*if(jogadorExistente != null){
            System.debug('Entrou jogadorExistente diferente nulo');
            novoJogador = jogadorExistente;
        }*/

        //Remover usuário ja selecionado da lista
        if(jogadorExistente != null && jogadorExistente.Id == novoJogador.Id){

            System.debug('Entrou jogador duplicado');
            System.debug('jogadorExistente: ' + JSON.serialize(jogadorExistente));
            System.debug('novoJogador: ' + JSON.serialize(novoJogador));
            
            while(selecionarJogador){
                novoJogador = Utils.obterJogadorAleatorio(jogadores);

                if(jogadorExistente.Id != novoJogador.Id){
                    selecionarJogador = false;
                }
            }

        }
        
        System.debug('novoJogadorSelecionado: ' + JSON.serialize(novoJogador));
        return novoJogador;
    }

    private void salvarAssassinato(Jogador__c jogadorAtaque, Jogador__c jogadorDefesa){
        Assassinato__c assassinato = new Assassinato__c();
        assassinato.Assassino__c = jogadorAtaque.Id;
        assassinato.Assassinado__c = jogadorDefesa.Id;
        assassinato.DataHora__c = Datetime.now();
        
        System.debug('salvarAssassinato: ' + JSON.serialize(assassinato));

        insert assassinato;
    }

}