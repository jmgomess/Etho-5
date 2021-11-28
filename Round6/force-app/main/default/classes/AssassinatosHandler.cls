public without sharing class AssassinatosHandler{

    public static void execute(){
        
    }

    public AssassinatosHandler(){
        System.debug('Entrou AssassinatosHandler');
        new AssassinatosHelper().verificarAssassinato();
        System.debug('Fim AssassinatosHandler');
    }

}