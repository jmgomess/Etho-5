import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class EasyForm extends LightningElement {
  filtros = { sobrenome: "", idade: "" };

  contatos = [
    { Id: 1, Name: "Renato", Sobrenome__c: "De Vico" },
    { Id: 2, Name: "Maria Sophia", Sobrenome__c: "De Vico" },
    { Id: 3, Name: "Arthur", Sobrenome__c: "Groissmann" }
  ];

  filtrarContatos() {
    return this.contatos.filter(
      (contato) => contato.Sobrenome__c == this.filtro
    );
  }

  get contatosFiltrados() {
    return this.filtrarContatos();
  }

  handleChange(event) {
    this.filtro[event.target.dataset.attributeName] = event.target.value;
  }

  /* salvar(event) {
    if (this.formularioValido()) {
      this.showToast("Sucesso!", "Registro", "success", "sticky");
    } else {
      this.showToast("ERROOOOOU", this.registro, "error", "sticky");
    }
  }

  formularioValido() {
    const allValid = [
      ...this.template.querySelectorAll("lightning-input")
    ].reduce((validSoFar, inputCmp) => {
      return validSoFar && inputCmp.checkValidity();
    }, true);

    return allValid;
  }

  showToast(title, message, variant, mode) {
    const event = new ShowToastEvent({
      title: title,
      message: message,
      variant: variant,
      mode: mode
    });
    this.dispatchEvent(event);
  } */
}
