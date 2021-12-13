public without sharing class CandidatosCEPAlteradoSchedulable implements Schedulable {

    public void execute(SchedulableContext sc) {
        Database.executeBatch(new CandidatosCEPAlteradoBatchable(), 200);
    }

}
