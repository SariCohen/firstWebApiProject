using Entities.Models;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Repositories
{


    public class RatingRepository : IRatingRepository
    {
        private readonly IConfiguration _configuration;

        public RatingRepository(Store214493777Context store214493777Context, IConfiguration configuration)
        {
           _configuration = configuration;
            
        }

        public Rating AddRating(Rating rating)
        {
            string query = "INSERT INTO Rating(Host, Method, Path, Referer, UserAgent, RecordDate) " +
                "VALUES(@Host, @Method, @Path, @Referer, @UserAgent, @RecordDate)";
            using (SqlConnection con = new SqlConnection(_configuration.GetConnectionString("connectionString")))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@Host", SqlDbType.NVarChar, 50).Value = rating.Host;
                cmd.Parameters.Add("@Method", SqlDbType.NChar, 10).Value = rating.Method;
                cmd.Parameters.Add("@Path", SqlDbType.NVarChar, 50).Value = rating.Path;
                cmd.Parameters.Add("@Referer", SqlDbType.NVarChar, 100).Value = rating.Referer;
                cmd.Parameters.Add("@UserAgent", SqlDbType.NVarChar,300).Value = rating.UserAgent;
                cmd.Parameters.Add("@RecordDate", SqlDbType.DateTime).Value = rating.RecordDate;

                con.Open();
                //rowAffected += cmd.ExecuteNonQuery();
                con.Close();
            }
            return rating;
        }

    }


}
