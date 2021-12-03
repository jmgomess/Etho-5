import { LightningElement } from "lwc";

export default class ComponenteFilho extends LightningElement {
  click(event) {
    event.preventDefault();
    this.dispatchEvent(new CustomEvent("mudanomes"));
  }
}
