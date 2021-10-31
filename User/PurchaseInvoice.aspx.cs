
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class PurchaseInvoice : System.Web.UI.Page
    {
        private object panelPDF;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string invoiceNo = (string)Session["invoiceNo"];
                // int invoice = Convert.ToInt32(invoiceNo);
                string item = (string)Session["itemCode"];
                int itemCode = Convert.ToInt32(item);

                if (!this.IsPostBack)
                {
                    string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT PurchasedItems.InvoiceNo,Supplier.Supp_name,PurchasedItems.PurchasedDate,PurchasedItems.Quantity,PurchasedItems.Amount,PurchasedItems.TotalAmount,Items.ItemName FROM ((PurchasedItems INNER JOIN Items ON Items.ItemCode = PurchasedItems.ItemCode) INNER JOIN Supplier ON Supplier.Supp_id = PurchasedItems.Supp_id) WHERE Items.ItemCode = " + itemCode))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                            
                                    // invoiceTextBox.Text = sdr["InvoiceNo"].ToString();
                                    invoiceTextBox.Text = invoiceNo;
                                    billDateTextBox.Text = sdr["PurchasedDate"].ToString();
                                    supplierNameTextBox.Text = sdr["Supp_name"].ToString();
                                    itemNameTextBox.Text = sdr["ItemName"].ToString();
                                    itemNameTextBox1.Text = sdr["ItemName"].ToString();
                                    quantityTextBox.Text = sdr["Quantity"].ToString();
                                    priceTextBox.Text = sdr["Amount"].ToString();
                                    totalAmountTextBox1.Text = sdr["TotalAmount"].ToString();


                                    totalAmountTextBox.Text = sdr["TotalAmount"].ToString();
                                
                                
                            }
                            con.Close();
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                //Response.Write("<script language=javascript>alert('Please Insert the Purchase Details before Creating an Invoice');</script>");
                Response.Redirect("/User/PurchaseItems.aspx");
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void generatePdfButton_Click(object sender, EventArgs e)
        {
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);

            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);

            
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            //HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            //pdfDoc.Open();
            //htmlParser.Parse(sr);
            //pdfDoc.Close();

            //Response.Write(pdfDoc);
            //Response.End();
        }
       

    }
}
