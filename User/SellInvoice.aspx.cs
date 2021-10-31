using System;
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
    public partial class SellInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT SellItems.InvoiceNo,SellItems.BillDate,SellItems.CustomerId,Customer.CustomerName,SellItems.Quantity,SellItems.Price,SellItems.TotalAmount,Items.ItemName FROM ((SellItems INNER JOIN Items ON Items.ItemCode = SellItems.ItemCode) INNER JOIN Customer ON Customer.CustomerId=SellItems.CustomerId) ORDER BY InvoiceNo DESC"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            invoiceTextBox.Text = sdr["InvoiceNo"].ToString();
                            billDateTextBox.Text = sdr["BillDate"].ToString();
                            customerId.Text = sdr["CustomerId"].ToString();
                            customerNameTextBox.Text= sdr["CustomerName"].ToString();
                            itemNameTextBox.Text = sdr["ItemName"].ToString();
                            itemNameTextBox1.Text = sdr["ItemName"].ToString();
                            quantityTextBox.Text = sdr["Quantity"].ToString();
                            priceTextBox.Text = sdr["Price"].ToString();
                            totalAmountTextBox1.Text = sdr["TotalAmount"].ToString();


                            totalAmountTextBox.Text = sdr["TotalAmount"].ToString();

                        }
                        con.Close();
                    }
                }
            }
        }
    }
}