public without sharing class AssassinatosHandler{

    public static void execute(){
        System.debug('Entrou AssassinatosHandler');
        new AssassinatosHelper().verificarAssassinato();
        System.debug('Fim AssassinatosHandler');
    }

}