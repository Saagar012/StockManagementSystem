using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class StockDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // string str = WebConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

            // SqlConnection con = new SqlConnection(str);
            // SqlCommand cmd = new SqlCommand("Select * from PurchasedItems", con);
            //// cmd.CommandType = CommandType.StoredProcedure;
            // con.Open();
            // SqlDataAdapter sda = new SqlDataAdapter(cmd);
            // DataSet ds = new DataSet();
            // sda.Fill(ds);
            // GridView1.DataSource = ds;
            // GridView1.DataBind();
            // con.Close();

            //string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Customer"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                GridView1.DataSource = dt;
            //                GridView1.DataBind();
            //            }
            //        }
            //    }
            //}


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                //GridView1.DataSource = SqlDataSource1;
                //GridView1.DataBind();
                //GridView2.Dispose();
                // TextBox1.Text = DropDownList1.SelectedValue;
                //if (!this.IsPostBack)
                //{
                    string str = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(str);
                    //con.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("Select PurchasedItems.InvoiceNo,Items.ItemName,PurchasedItems.ItemCode,PurchasedItems.PurchasedDate,PurchasedItems.Quantity,PurchasedItems.TotalAmount from PurchasedItems INNER JOIN Items ON PurchasedItems.ItemCode=Items.ItemCode WHERE PurchasedItems.Quantity < 10 ORDER BY ItemName", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    con.Close();

                //}
            }
            
            if (DropDownList1.SelectedValue == "2")
            {
                string str = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("Select PurchasedItems.InvoiceNo,Items.ItemName,PurchasedItems.ItemCode,PurchasedItems.PurchasedDate,PurchasedItems.Quantity,PurchasedItems.TotalAmount from PurchasedItems INNER JOIN Items ON PurchasedItems.ItemCode=Items.ItemCode WHERE PurchasedItems.Quantity < 10 ORDER BY PurchasedItems.Quantity DESC", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();

            }
            if (DropDownList1.SelectedValue == "3")
            {
                string str = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("Select PurchasedItems.InvoiceNo,Items.ItemName,PurchasedItems.ItemCode,PurchasedItems.PurchasedDate,PurchasedItems.Quantity,PurchasedItems.TotalAmount from PurchasedItems INNER JOIN Items ON PurchasedItems.ItemCode=Items.ItemCode WHERE PurchasedItems.Quantity < 10 ORDER BY PurchasedItems.PurchasedDate DESC", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();
            }
        }
    }
}