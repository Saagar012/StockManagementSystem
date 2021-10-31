using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addCategoryButton_Click(object sender, EventArgs e)
        {
            //check if the category is duplicate
            DataView dataview = (DataView)SqlDataSourceGetCategory.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;
            if (duplicate)
            {
                
                Response.Write("<script>alert('Add Category Failed : duplicate entry !')</script>");


            }
            else
            {
                SqlDataSourceCategory.InsertParameters["CategoryName"].DefaultValue = txtCategory.Text;
                SqlDataSourceCategory.InsertParameters["Description"].DefaultValue = textDesc.Text;
                SqlDataSourceCategory.Insert();
                txtCategory.Text = "";
                textDesc.Text = "";
            }

        }
    }
}