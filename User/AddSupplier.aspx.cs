using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addSupplierBtn_Click(object sender, EventArgs e)
        {
            //check if the category is duplicate
            DataView dataview = (DataView)CheckSupplierSqlDataSource.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;
            if (duplicate)
            {
                Response.Write("<script>alert('Duplicate Entry ! Please Add a new Supplier Name !')</script>");

              

            }
            else
            {
                InsertSupplierSqlDataSource.InsertParameters["Supp_name"].DefaultValue = sup_name.Text;
                InsertSupplierSqlDataSource.InsertParameters["Mobile"].DefaultValue = mobile.Text;
                InsertSupplierSqlDataSource.InsertParameters["Email"].DefaultValue = email.Text;
                InsertSupplierSqlDataSource.InsertParameters["Address"].DefaultValue = address.Text;
                InsertSupplierSqlDataSource.Insert();
                //Response.Write("Supplier Added");
               
            }
        }

    }
}