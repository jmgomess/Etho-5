import { LightningElement, api } from 'lwc';

export default class ExibirNome extends LightningElement {
    @api nomeVariavelEscaralhada;

    get funcaoParaPegarNome() {
        return 'Nome: ' + this.nomeVariavelEscaralhada;
    }
}