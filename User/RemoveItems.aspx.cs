using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class RemoveItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void removeButton_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

            using (var conn = new SqlConnection(connection))
            {
                conn.Open();
                string delSql = @"DELETE FROM purchasedItems WHERE PurchasedDate < GETDATE() - 365";
                using (var cmd = new SqlCommand(delSql, conn))
                {
                    //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                     cmd.ExecuteNonQuery();
                }
            }

        }
    }
}