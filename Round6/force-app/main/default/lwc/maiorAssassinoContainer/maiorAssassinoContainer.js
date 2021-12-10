import { LightningElement, api } from 'lwc';

export default class MaiorAssassinoContainer extends LightningElement {
    @api assassino;

    get maioresAssassinos() {
        if (this.roundSelecionado) {
           /* let maiorValor = this.roundSelecionado.Jogadores__r[0].QuantidadeAssassinatos__c;
            return this.roundSelecionado.Jogadores__r.filter(
                (jogador) => jogador.QuantidadeAssassinatos__c === maiorValor
            );*/

            let jogadoresRound = [...this.roundSelecionado.Jogadores2__r];
    
            let maiorValor = 0;
            let jogadoresMaiorAssassinatos = []; 

            for(let i = 0; i < jogadoresRound.length; i++) {
                if(jogadoresRound[i].QuantidadeAssassinatos__c >= maiorValor){
                maiorValor = jogadoresRound[i].QuantidadeAssassinatos__c;

                jogadoresMaiorAssassinatos.push(jogadoresRound[i]);
                }
            }

        }
        return [];
    }
}