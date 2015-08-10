using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;                       //These namespaces you have
using Microsoft.WindowsAzure.Storage.Auth;                  //to include
using Microsoft.WindowsAzure.Storage.Table;                 //by yourself 
using Microsoft.Azure;                                      // (if moving the content of this file to another file)


namespace NextGames
{
    public class WebRole : RoleEntryPoint                  
    {
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
            CloudConfigurationManager.GetSetting("StorageConnectionString"));      //"StorageConnectionString" is the name of the connection string which you have created in Step 5

        
        public override bool OnStart()
        {
            // Retrieve the storage account from the connection string.
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
            CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the table client.
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();      //A CloudTableClient object lets you get reference objects for tables and entities
                                                                                        
            // Create the table if it doesn't exist.
            CloudTable table = tableClient.GetTableReference("ChatTable");
            table.CreateIfNotExists();

            // Retrieve the storage account from the connection string.
            storageAccount = CloudStorageAccount.Parse(
            CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the table client.
            tableClient = storageAccount.CreateCloudTableClient();

            // Create the CloudTable object that represents the "ChatTable" table.
            table = tableClient.GetTableReference("ChatTable");

            // Create a new  user+message entity.
            ChatTable msg = new ChatTable();            
            msg.Message = "use your message input textbox here";                           //connect with your message input textbox
            msg.Name = "use the username input textbox here";                             //connect with your user name textbox

            // Create the TableOperation object that inserts the user+message entity.
            TableOperation insertOperation = TableOperation.Insert(msg);

            // Execute the ChatTable operation.
            table.Execute(insertOperation);

            // Retrieve the storage account from the connection string.
            storageAccount = CloudStorageAccount.Parse(
             CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the table client.
            tableClient = storageAccount.CreateCloudTableClient();

            // Create the CloudTable object that represents the "ChatTable" table.
            table = tableClient.GetTableReference("ChatTable");

            // Create a retrieve operation that takes a user+message entity.
            TableOperation retrieveOperation = TableOperation.Retrieve<ChatTable>("Hello", "User");     //change to your output destination

            // Execute the retrieve operation.
            TableResult retrievedResult = table.Execute(retrieveOperation);

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            return base.OnStart();
        }
    }
}
