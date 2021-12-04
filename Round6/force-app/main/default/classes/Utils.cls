public without sharing class Utils {

    public static void setValue(SObject record, Schema.SObjectField field, Object value) {
        record.put(field, value);
    }

    public static Set<Id> getSetIds(List<SObject> sObjs, Schema.SObjectField field) {
        Set<Id> ids = new Set<Id>();

        for (SObject sObj : sObjs) {
            ids.add(Id.valueOf(String.valueOf(sObj.get(field))));
        }

        return ids;
    }

    //TODO: desenvolver esse cálculo aleatório.
    //retornar número aleatório entre X e Y (inclusivo)
    //x <= retorno <= y
    public static Integer generateRandomIntegerBetween(Integer x, Integer y) {
        return (y - x);
    }

    //Criar a funcao para jogar os dados
    public static Integer jogarDado(Integer quantidadeLados){
        //return new Random().nextInt(quantidadeLados) + 1;
        return Integer.valueof(Math.random() * quantidadeLados)+1;
    }

    public static Jogador__c obterJogadorAleatorio(List<Jogador__c> jogadores){
        return jogadores.get(Integer.valueof((Math.random() * jogadores.size())));
    }
	
	public static Integer geraNumero(Integer valorInicial, Integer valorFinal, Integer valorParaSeEvitar) {
        if (valorFinal > valorInicial) {
            Integer valor;
            while (valor == null || valor == valorParaSeEvitar) {
                //TODO: garantir que não vai ficar com o valorParaSeEvitar repetindo
                valor = valorInicial + Integer.valueof(Math.random() * ((valorFinal - valorInicial) + 1));
            }
            return valor;
        } 
        return -1;
    }

}