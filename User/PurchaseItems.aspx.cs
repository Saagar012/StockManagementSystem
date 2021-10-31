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
    public partial class PurchaseItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    viewDateCalendar.Visible = false;

            //}
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT PurchasedItems.InvoiceNo from  PurchasedItems ORDER BY InvoiceNo DESC"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                int a = Convert.ToInt32(sdr["InvoiceNo"]);
                                int b = a + 1;
                                if (sdr["InvoiceNo"] == null)
                                {
                                    invoiceNo.Text = "1";
                                }
                                else
                                {
                                    invoiceNo.Text = b.ToString();
                                }
                            }
                            else
                            {
                                invoiceNo.Text = "1";
                            }
                            //invoiceNo.Text = b.ToString();
                            con.Close();
                        }
                    }
                }
            }
        }

        int quantity12 = 0;
        int quantity123 = 0;
        int finalQuantity = 0;
        


        int totalAmount12 = 0;
        int totalAmount123 = 0;
        int finalAmount = 0;
        //string updatedDate = "";
        int price = 0;
        int updated;
        protected void purchaseItemBtn_Click(object sender, EventArgs e)
        {
            Session["itemCode"] = ItemDropDownList.SelectedItem.Value;
            Session["invoiceNo"] = invoiceNo.Text;
            //// check if the Item is duplicate
            DataView dataview = (DataView)CheckItemsSqlDataSource.Select(DataSourceSelectArguments.Empty);
            bool duplicateItems = dataview.Table.Rows.Count > 0;
           // bool duplicateSuppliers = dataview.Table.Rows.Count > 0;
            int itemCode = Convert.ToInt32(ItemDropDownList.SelectedItem.Value);
            //int supplierCode= Convert.ToInt32(supplierDropDownList.SelectedItem.Value);
            if (duplicateItems)
            {
                   
                    string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT * from  PurchasedItems WHERE PurchasedItems.ItemCode="+ itemCode))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                               
                                quantity12 = Convert.ToInt32(sdr["Quantity"]);
                                quantity123 = Convert.ToInt32(quantity.Text);
                                finalQuantity = quantity12 + quantity123;

                                price = Convert.ToInt32(amount.Text);
                                // finalDate = Convert.ToInt32(updatedDate);
                                totalAmount12 = Convert.ToInt32(sdr["TotalAmount"]);
                                totalAmount123=Convert.ToInt32(totalAmount.Text);
                                finalAmount = totalAmount12 + totalAmount123;
                                

                            con.Close();
                            }
                        }
                    }
               
                string connection = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

                using (var conn = new SqlConnection(connection))
                {
                    conn.Open();
                    string updSql = @"UPDATE purchasedItems SET Quantity =" + finalQuantity + "," + "Amount =" + price + ","+ "TotalAmount =" + finalAmount + "  WHERE ItemCode =" + itemCode;
                    using (var cmd = new SqlCommand(updSql, conn))
                    {
                        //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                        updated = cmd.ExecuteNonQuery();
                    }
                }


                using (var con1 = new SqlConnection(connection))
                {
                    string oDate = billDate.Text;

                    con1.Open();
                    string updSql = @"UPDATE purchasedItems SET PurchasedDate ='" + oDate + "'  WHERE ItemCode =" + itemCode;
                    using (var cmd = new SqlCommand(updSql, con1))
                    {
                        //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                        updated = cmd.ExecuteNonQuery();
                    }
                }






            }
           
            else
            {
                purchaseItemsSqlDataSource.InsertParameters["InvoiceNo"].DefaultValue = invoiceNo.Text;
                purchaseItemsSqlDataSource.InsertParameters["PurchasedDate"].DefaultValue = billDate.Text;
                purchaseItemsSqlDataSource.InsertParameters["Supp_Id"].DefaultValue = supplierDropDownList.SelectedItem.Value;
                purchaseItemsSqlDataSource.InsertParameters["ItemCode"].DefaultValue = ItemDropDownList.SelectedItem.Value;
                purchaseItemsSqlDataSource.InsertParameters["Quantity"].DefaultValue = quantity.Text;
                purchaseItemsSqlDataSource.InsertParameters["Amount"].DefaultValue = amount.Text;
                purchaseItemsSqlDataSource.InsertParameters["TotalAmount"].DefaultValue = totalAmount.Text;

                purchaseItemsSqlDataSource.Insert();
                //purchaseItemsSqlDataSource.DataBind();
                //Response.Write("Item Added");


            }
            //InsertStockSqlDataSource.InsertParameters["ItemName"].DefaultValue = ItemDropDownList.SelectedItem.Value;
            //InsertStockSqlDataSource.InsertParameters["Quantity"].DefaultValue = quantity.Text;
            //InsertStockSqlDataSource.InsertParameters["AddedDate"].DefaultValue = billDate.Text;
            //InsertStockSqlDataSource.Insert();
            //insertSqlDataSource.DataBind();
            // Response.Write("Item Added");
            invoiceNo.Text = "";
            billDate.Text = "";
            quantity.Text = "";
            amount.Text = "";
            totalAmount.Text = "";

        }

        //    protected void billDateCalendar_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (viewDateCalendar.Visible)
        //    {
        //        viewDateCalendar.Visible = false;
        //    }
        //    else
        //    {
        //        viewDateCalendar.Visible = true;
        //    }
        //}
        //protected void viewDateCalendar_SelectionChanged(object sender, EventArgs e)
        //{
        //    billDate.Text = viewDateCalendar.SelectedDate.ToString("yyyy-MM-dd");
        //    viewDateCalendar.Visible = false;
        //}
        //protected void viewDateCalendar_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.IsOtherMonth)
        //    {
        //        e.Day.IsSelectable = false;
        //    }
        //}

        protected void CheckItemsSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void saveItemsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/User/PurchaseInvoice.aspx");
        }
    }
}