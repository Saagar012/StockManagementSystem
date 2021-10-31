using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.User
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            username.Text = (string)Session["user"];


        }
        protected void changePasswordBtn_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

            try
            {
                string Uname = username.Text;
                string oldpass = oldpassword.Text;
                string newpass = newpassword.Text;
                string conpass = confirmpassword.Text;
                //string pass = password.Text;
                int updated;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    string qry = "select * from Users where UserName='" + Uname + "' and password='" + oldpass + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        if (newpass == conpass)
                        {


                            string connection = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

                            using (var conn = new SqlConnection(connection))
                            {
                                conn.Open();
                                string updSql = @"UPDATE Users SET password = '" + newpass + "'  WHERE UserName = '" + Uname + "'";
                                using (var cmd1 = new SqlCommand(updSql, conn))
                                {
                                    //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                                    updated = cmd1.ExecuteNonQuery();

                                    username.Text = "";
                                    oldpassword.Text = "";
                                    newpass = "";
                                    conpass = "";
                                    Response.Write("<script language=javascript>alert('Your Password is now Updated.');</script>");
                                    //Response.Redirect("/User/dashboard.aspx");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('Failed ! New Password and Confirm New Password do not match');</script>");

                        }

                    }
                    else
                    {

                        Response.Write("<script language=javascript>alert('Login Failed ! Please Enter correct Username and Password');</script>");

                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}