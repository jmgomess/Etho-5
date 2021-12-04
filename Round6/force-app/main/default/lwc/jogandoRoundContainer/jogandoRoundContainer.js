import { LightningElement, api } from "lwc";

export default class JogandoRoundContainer extends LightningElement {
  @api roundSelecionado;

  get jogadores() {
    if (this.roundSelecionado) {
      return this.roundSelecionado.Jogadores2__r;
    }
    return [];
  }
}
