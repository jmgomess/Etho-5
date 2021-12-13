public without sharing class CustomNotification {

    public static void notifyUsers(Candidato__c record) {
        
        Set<String> recipientsIds = new Set<String>{'0055f000004yuxKAAQ'};

        // Get the Id for our custom notification type
        CustomNotificationType notificationType = [
            SELECT Id, DeveloperName 
            FROM CustomNotificationType 
            WHERE DeveloperName='DesktopCelular'
        ];
        
        // Create a new custom notification
        Messaging.CustomNotification notification = new Messaging.CustomNotification();

        // Set the contents for the notification
        notification.setTitle('⚠️ ' + record.Name + ' ⚠️');
        notification.setBody('➡️ CEP alterado! \n➡️ Favor conferir as informações de endereço.');

        // Set the notification type and target
        notification.setNotificationTypeId(notificationType.Id);
        notification.setTargetId(record.Id);
        
        // Actually send the notification
        try {
            notification.send(recipientsIds);
        }
        catch (Exception e) {
            System.debug('Problem sending notification: ' + e.getMessage());
        }
    }
}