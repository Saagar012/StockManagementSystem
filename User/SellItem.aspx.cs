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
    public partial class SellItem : System.Web.UI.Page
    {
       
        public IEnumerable<object> CheckInvoiceSqlDataSource { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //invoiceNo.Text = "1";
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT SellItems.InvoiceNo from  SellItems ORDER BY InvoiceNo DESC"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                if (sdr["InvoiceNo"] == null)
                                {
                                    invoiceNo.Text = "1";
                                }
                                else
                                {
                                    int a = Convert.ToInt32(sdr["InvoiceNo"]);
                                    int b = a + 1;
                                    invoiceNo.Text = b.ToString();
                                }
                            }
                            else
                            {
                                invoiceNo.Text = "1";
                            }

                        }
                        con.Close();
                    }
                }
            }
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT SellItems.CustomerId from  SellItems ORDER BY CustomerId DESC"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                sdr.Read();

                                if (sdr["CustomerId"] == null)
                                {
                                    customerId.Text = "1";
                                }
                                else
                                {
                                    int a1 = Convert.ToInt32(sdr["CustomerId"]);
                                    int b1 = a1 + 1;
                                    customerId.Text = b1.ToString();
                                }
                            }
                            else
                            {
                                customerId.Text = "1";

                            }

                        }
                        con.Close();
                    }
                }
            }
        }
        int itemCodes = 0;

        int finalQuantity = 0;

        protected void sellItemBtn_Click(object sender, EventArgs e)
        {

            //insert the data in sell item and finally update the purchase table data

            //DataView dataview = (DataView)CheckItemsSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //bool duplicateItems = dataview.Table.Rows.Count > 0;
            //if (duplicateItems)
            //{
            //   // Response.Write("Purchase Items Failed : duplicate Invoice No.");


            //}
            //else
            //{
            if (Convert.ToInt32(quantity.Text) > Convert.ToInt32(totalStock.Text))
            {
                Response.Write("<script>alert('Sell Items Failed !  Quantity can not be greater than the total Stock', 'Please Try Again!', 'error')</script>");

            }
            else
            {



                InsertCustomerSqlDataSource.InsertParameters["CustomerId"].DefaultValue = customerId.Text;
                InsertCustomerSqlDataSource.InsertParameters["CustomerName"].DefaultValue = customerName.Text;
                InsertCustomerSqlDataSource.InsertParameters["Address"].DefaultValue = customerAddress.Text;
                InsertCustomerSqlDataSource.InsertParameters["Email"].DefaultValue = email.Text;
                InsertCustomerSqlDataSource.InsertParameters["ContactNo"].DefaultValue = phone.Text;
                InsertCustomerSqlDataSource.InsertParameters["CustomerType"].DefaultValue = customerTypeDropDownList.SelectedItem.Value;
                InsertCustomerSqlDataSource.Insert();

                SellSqlDataSource.InsertParameters["InvoiceNo"].DefaultValue = invoiceNo.Text;
                SellSqlDataSource.InsertParameters["BillDate"].DefaultValue = billDate.Text;
                SellSqlDataSource.InsertParameters["ItemCode"].DefaultValue = itemDropDownList.SelectedItem.Value;
                SellSqlDataSource.InsertParameters["CategoryId"].DefaultValue = category.Text;
                SellSqlDataSource.InsertParameters["CustomerId"].DefaultValue = customerId.Text;
                SellSqlDataSource.InsertParameters["Quantity"].DefaultValue = quantity.Text;
                SellSqlDataSource.InsertParameters["Price"].DefaultValue = price.Text;
                SellSqlDataSource.InsertParameters["TotalAmount"].DefaultValue = amount.Text;
                SellSqlDataSource.Insert();




                //purchaseItemsSqlDataSource.DataBind();
                //Response.Write("Item Added");

                //update the quantity in purchasedItems table after selling a item.

                //if (!this.IsPostBack)
                //{
                //    string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                //    using (SqlConnection con = new SqlConnection(constr))
                //    {
                //        using (SqlCommand cmd = new SqlCommand("SELECT PurchasedItems.ItemCode from  PurchasedItems INNER JOIN SellItems ON PurchasedItems.ItemCode=SellItems.ItemCode"))
                //        {
                //            cmd.CommandType = CommandType.Text;
                //            cmd.Connection = con;
                //            con.Open();
                //            using (SqlDataReader sdr = cmd.ExecuteReader())
                //            {
                //                sdr.Read();
                //                itemCodes = Convert.ToInt32(sdr["ItemCode"]);
                //                //itemCodes = itemCode.ToString();
                //                //int b = a + 1;
                //                //invoiceNo.Text = b.ToString();
                //                //con.Close();
                //            }
                //        }
                //    }
                //}
                itemCodes = Convert.ToInt32(itemCode.Text);


                int quantity1 = Convert.ToInt32(quantity.Text);
                int stock1 = Convert.ToInt32(totalStock.Text);
                finalQuantity = stock1 - quantity1;

                int updated;
                string connection = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

                using (var conn = new SqlConnection(connection))
                {
                    conn.Open();
                    string updSql = @"UPDATE purchasedItems SET Quantity = '" + finalQuantity + "'  WHERE ItemCode = '" + itemCodes + "'";
                    using (var cmd = new SqlCommand(updSql, conn))
                    {
                        //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                        updated = cmd.ExecuteNonQuery();
                    }
                }
                //int quantity1 = Convert.ToInt32(quantity.Text);
                //int stock1 = Convert.ToInt32(totalStock.Text);
                //int finalQuantity = stock1 - quantity1;
                //quantity.Text = finalQuantity.ToString();
                //UpdateQuantitySqlDataSource.UpdateParameters["Quantity"].DefaultValue = quantity.Text;
                //UpdateQuantitySqlDataSource.Update();

                // }

                //DataView dataview = (DataView)CheckEmailSqlDataSource.Select(DataSourceSelectArguments.Empty);
                //bool duplicateInvoice = dataview.Table.Rows.Count > 0;
                //if (duplicateInvoice)
                //{
                //    Response.Write("Sell Items Failed : duplicate Email No.");

                //}
                //else
                //{

                //    InsertCustomerSqlDataSource.InsertParameters["CustomerName"].DefaultValue = customerName.Text;
                //    InsertCustomerSqlDataSource.InsertParameters["Address"].DefaultValue = customerAddress.Text;
                //    InsertCustomerSqlDataSource.InsertParameters["ContactNo"].DefaultValue = phone.Text;
                //    InsertCustomerSqlDataSource.InsertParameters["Email"].DefaultValue = email.Text;
                //    InsertCustomerSqlDataSource.InsertParameters["CustomerType"].DefaultValue = customerTypeDropDownList.SelectedItem.Value;
                //    InsertCustomerSqlDataSource.Insert();
                //}
                invoiceNo.Text = "";
                billDate.Text = "";
                category.Text = "";
                customerName.Text = "";
                customerAddress.Text = "";
                email.Text = "";
                phone.Text = "";
                quantity.Text = "";
                price.Text = "";
                amount.Text = "";



                Response.Redirect("/User/SellInvoice.aspx");

            }

        }

        protected void totalStock_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            itemCode.Text = itemDropDownList.SelectedItem.Value;
        }

        protected void invoiceNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void getItemsSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            category.Text = categoryDropDownList.SelectedItem.Value;

        }

        protected void stockDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            totalStock.Text = stockDropDownList.SelectedItem.Value;

        }
    }
}