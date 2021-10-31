using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string itemName="";
            int quantity=0;
            //int[] array= { };
            //if (!this.IsPostBack)
            //{
            var arraylist = new ArrayList();
            string finalItems = "";
            string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT PurchasedItems.Quantity,Items.ItemName FROM PurchasedItems INNER JOIN Items ON Items.ItemCode = PurchasedItems.ItemCode"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                       
                        
                        while (sdr.Read())
                        {
                            itemName = sdr["ItemName"].ToString();
                            quantity = Convert.ToInt32(sdr["Quantity"]);
                            //we have to create an array and put all these itemname in that array and finally display them in the alert box
                            if (quantity < 10)
                            {
                                arraylist.Add(itemName);
                            }
                        }
                        
                        for (int i = 0; i < arraylist.Count; i++)
                        {
                            if (i == arraylist.Count - 1)
                            {
                                finalItems = finalItems + arraylist[i];
                            }
                            else {
                                finalItems = finalItems + arraylist[i] + ",";
                            }

                        }
                     
                       string final= finalItems.Replace(" ", string.Empty);

                        if (final=="")
                        {
                            Response.Write("<script>alert('No Items are Running Out of Stock !')</script>");

                        }
                        else
                        {
                            // Response.Write("<script>alert('User Alert ! " + 123 + "are out of Stock')</script>");
                            Response.Write("<script>alert('User Alert ! " + final + " are Running out of Stock')</script>");
                        }
                       
                       // Response.Write("<script>alert('"+finalItems+"')</script>");

                        // }
                    }


                    con.Close();
                    //}
                }
            }




        }


        protected void searchButton_Click(object sender, EventArgs e)
        {
            //DataClasses1DataContext dc = new DataClasses1DataContext();
            //DateTime fromDate = Convert.ToDateTime(txtFrom.Text);
            //DateTime toDate = Convert.ToDateTime(txtTo.Text);
            //var result = from x in dc.PurchasedItems where x.PurchasedDate >= fromDate && x.PurchasedDate <= toDate select x;
            //GridView1.DataSource = result;
            //GridView1.DataBind();

            DataClasses2DataContext dc1 = new DataClasses2DataContext();
            DateTime fromDate = Convert.ToDateTime(txtFrom.Text);
            DateTime toDate = Convert.ToDateTime(txtTo.Text);
            var result = from x in dc1.SellItems where x.BillDate >= fromDate && x.BillDate <= toDate select x;
            GridView1.DataSource = result;
            GridView1.DataBind();

        }

       
    }
}