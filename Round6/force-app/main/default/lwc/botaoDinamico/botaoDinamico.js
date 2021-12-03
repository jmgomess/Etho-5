import { LightningElement } from 'lwc';

export default class BotaoDinamico extends LightningElement {
    @api pagina;
    
    get botaoClass() {
        if (pagina == 'home') {
            return 'blue'
        } else {
            return 'green';
        }
    }

    handleClick(event) {
        if (pagina == 'home') {
            salvar();
        } else {
            cancelar();
        }
    }
}