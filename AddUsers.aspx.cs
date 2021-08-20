using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.Admin
{
    public partial class AddUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void addUserBtn_Click(object sender, EventArgs e)
        {
            // check if the Item is duplicate
            DataView dataview = (DataView)CheckUsersSqlDataSource.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;
            if (duplicate)
            {
                Response.Write("<script language=javascript>alert('Add User Failed : duplicate entry');</script>");
                //Response.Write("Add User Failed : duplicate entry");

            }
            else
            {
                InsertUsersSqlDataSource.InsertParameters["UserName"].DefaultValue = username.Text;
                InsertUsersSqlDataSource.InsertParameters["password"].DefaultValue = password.Text;

                InsertUsersSqlDataSource.Insert();
                username.Text = "";
                password.Text = "";
          
                //insertItemsSqlDataSource.DataBind();
                //Response.Write("Item Added");
            }



        }
    }
}