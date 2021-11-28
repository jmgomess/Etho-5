public without sharing class AssassinatosHandler{

    public AssassinatosHandler(){
        System.debug('Entrou AssassinatosHandler');
        new AssassinatosHelper().verificarAssassinato();
        System.debug('Fim AssassinatosHandler');
    }

}
