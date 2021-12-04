import { api, LightningElement } from "lwc";

export default class JogadorContainer extends LightningElement {
  @api jogador;

  get vivoMortoClass() {
    return this.jogador.Morreu__c ? "morto" : "vivo";
  }
}
