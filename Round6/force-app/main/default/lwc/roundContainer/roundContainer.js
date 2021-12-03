import { LightningElement, api } from "lwc";

export default class RoundContainer extends LightningElement {
  @api round;
  removeJogador;

  @api
  get removeJogadores() {
    return this.removeJogador;
  }
  set removeJogadores(value) {
    this.removeJogador = value;
    if (value) {
      this.round = { ...this.round, Jogadores2__r: [] };
    }
  }
  toggleList = false;

  handleClick(event) {
    event.preventDefault();
    this.toggleList = !this.toggleList;
  }
}
