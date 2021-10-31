using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            
        }
        
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Session["user"] = username.Text;

            string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;
            
            try
            {
                string name = username.Text;
                string password12 = password.Text;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    string qry = "select * from Admin where adminName='" + name + "' and password='" + password12 + "'";
                    string qry1 = "select * from Users where UserName='" + name + "' and password='" + password12 + "'";

                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlCommand cmd1 = new SqlCommand(qry1, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    SqlDataReader sdr1 = cmd1.ExecuteReader();
                    if (sdr.Read())
                    {
                       // FormsAuthentication.RedirectFromLoginPage(username.Text, true);
                          Response.Redirect("/Admin/Dashboard.aspx");
                        con.Close();
                    }
                    else if (sdr1.Read())
                    {
                        FormsAuthentication.RedirectFromLoginPage(name, true);

                        //Response.Redirect("/User/dashboard.aspx");
                        con.Close();
                    }
                    else
                    {
                        //   Response.Write("<script language=javascript>alert('Login Failed!', 'Please Try Again!', 'error');</script>");

                        Response.Write("<script language=javascript>alert('Please Enter correct Username and Password');</script>");

                    }
                   con.Close();
                }
             
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


            //try
            //{
               
            //    string uid1 = username.Text;
            //    string pass1 = password.Text;
            //    using (SqlConnection con = new SqlConnection(constr))
            //    {
            //        con.Open();
            //        string qry = "select * from Users where UserName='" + uid1 + "' and password='" + pass1 + "'";
            //        SqlCommand cmd = new SqlCommand(qry, con);
            //        SqlDataReader sdr = cmd.ExecuteReader();
            //        if (sdr.Read())
            //        {
            //            FormsAuthentication.RedirectFromLoginPage(uid1, true);

            //            //Response.Redirect("/User/dashboard.aspx");
            //        }
            //        else
            //        {
            //         //   Response.Write("<script language=javascript>alert('Login Failed!', 'Please Try Again!', 'error');</script>");

            //            Response.Write("<script language=javascript>alert('Please Enter correct Username and Password');</script>");

            //        }
            //        con.Close();
            //    }

            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}




        }
    }
}