using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Project;
using Dapper;

namespace Geppetto.Geppetto.dao
{
    public class productstockDAO
    {
        private readonly IDbConnection connection;

        public productstockDAO(IDbConnection connection)
        {
            this.connection = connection;
        }

        public IEnumerable<StorageArea> GetAllProducts()
        {
            string query = "GetProducts";
            return connection.Query<StorageArea>(query);

        }
    }
}
