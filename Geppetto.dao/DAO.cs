using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Geppetto.Geppetto.dao
{ }

public class DAO
{
    private readonly string connectionString;

    public DAO()
    {
        // Récupérer la chaîne de connexion depuis le fichier de configuration
        connectionString = "Server=LEONARD\\LEONARD;Database=BDD_RESTAU;Trusted_Connection=True";
    }

    public IDbConnection GetConnection()
    {
        return new SqlConnection(connectionString);
    }
}
