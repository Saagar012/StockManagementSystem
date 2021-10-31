using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            adminname.Text = (string)Session["user"];
        }

        protected void changePasswordBtn_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["StockManagementConnectionString"].ConnectionString;

            try
            {
                string Uname = adminname.Text;
                string oldpass = oldpassword.Text;
                string newpass = newpassword.Text;
                string conpass = confirmpassword.Text;
                //string pass = password.Text;
                int updated;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    string qry = "select * from Admin where adminName='" + Uname + "' and password='" + oldpass + "'";
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
                                string updSql = @"UPDATE Admin SET password = '" + newpass + "'  WHERE adminName = '" + Uname + "'";
                                using (var cmd1 = new SqlCommand(updSql, conn))
                                {
                                    //cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtRemoveUser.Text;
                                    updated = cmd1.ExecuteNonQuery();

                                    adminname.Text = "";
                                    oldpassword.Text = "";
                                    newpass = "";
                                    conpass = "";
                                    Response.Write("<script language=javascript>alert('Your Password is now Updated.');</script>");

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

                        Response.Write("<script language=javascript>alert('Password Updation Failed ! Please Try Again.');</script>");

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