import { LightningElement, wire, api } from "lwc";
import selectAll from "@salesforce/apex/RoundsContainerController.getRoundsJogadores";

export default class RoundsContainer extends LightningElement {
  loaded = false;
  roundsAux = [];

  get rounds() {
    return this.roundsAux;
  }

  connectedCallback() {
    selectAll()
      .then((result) => {
        this.roundsAux = result;
        this.loaded = true;
      })
      .catch((error) => {
        console.log(JSON.stringify(error));
        console.log(error);
      });
  }

  addJogadores(event) {
    this.loaded = false;
    selectAll()
      .then((result) => {
        this.roundsAux = result;
        this.loaded = true;
      })
      .catch((error) => {
        console.log(JSON.stringify(error));
        console.log(error);
      });
  }

  removeJogadores(event) {
    this.roundsAux = this.roundsAux.map((value) => {
      return { ...value, Jogadores2__r: [] };
    });
  }
}
