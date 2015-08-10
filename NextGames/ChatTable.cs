using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NextGames
{
    public class ChatTable : TableEntity
    {
        public string Name { get; set; }
        public string Message { get; set; }

    }
}