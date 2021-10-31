using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageDemo
{
    public partial class AddItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    if (!IsPostBack)
        //    {
        //        purchaseCalendar.Visible = false;
        //        mfdCalendar.Visible = false;
        //        expCalendar.Visible = false;
        //    }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void calendarImage1_Click(object sender, ImageClickEventArgs e)
        {
            //if (purchaseCalendar.Visible)
            //{
            //    purchaseCalendar.Visible = false;
            //}
            //else
            //{
            //    purchaseCalendar.Visible = true;
            //}
        }

        protected void purchaseCalendar_SelectionChanged(object sender, EventArgs e)
        {
            //purchaseDateTextField.Text = purchaseCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //purchaseCalendar.Visible = false;
        }
        protected void purchaseCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            //if (e.Day.IsOtherMonth)
            //{
            //    e.Day.IsSelectable = false;
            //}
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void calendarImage2_Click(object sender, ImageClickEventArgs e)
        {
            //if (mfdCalendar.Visible)
            //{
            //    mfdCalendar.Visible = false;
            //}
            //else
            //{
            //    mfdCalendar.Visible = true;
            //}
        }

        protected void mfdCalendar_SelectionChanged(object sender, EventArgs e)
        {
            //mfdTextBox.Text = mfdCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //mfdCalendar.Visible = false;
        }
          protected void mfdCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void expCalendarBtn_Click(object sender, ImageClickEventArgs e)
        {
            //if (expCalendar.Visible)
            //{
            //    expCalendar.Visible = false;
            //}
            //else
            //{
            //   expCalendar.Visible = true;
            //}
        }
        protected void expCalendar_SelectionChanged(object sender, EventArgs e)
        {
            //mfdTextBox.Text = mfdCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //mfdCalendar.Visible = false;
        }

        protected void expCalendar_SelectionChanged1(object sender, EventArgs e)
        {
            //expTextBox.Text =expCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //expCalendar.Visible = false;

        }



        protected void addItemBtn_Click(object sender, EventArgs e)
        {
            // check if the Item is duplicate
            DataView dataview = (DataView)CheckItemSqlDataSource.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;
            if (duplicate)
            {
                Response.Write("<script>alert('Duplicate Entry ! Please Add a new Item Name !')</script>");


            }
            else
            {
                insertItemsSqlDataSource.InsertParameters["ItemName"].DefaultValue = itemName.Text;
                insertItemsSqlDataSource.InsertParameters["Description"].DefaultValue = descTextBox.Text;
                insertItemsSqlDataSource.InsertParameters["CategoryId"].DefaultValue = categoryDropDownList.SelectedItem.Value;
                insertItemsSqlDataSource.InsertParameters["AddedDate"].DefaultValue = purchaseDateTextField.Text;
                insertItemsSqlDataSource.InsertParameters["MfDate"].DefaultValue = mfdTextBox.Text;
                insertItemsSqlDataSource.InsertParameters["ExpDate"].DefaultValue = expTextBox.Text;

                insertItemsSqlDataSource.Insert();
                itemName.Text = "";
                descTextBox.Text = "";
                purchaseDateTextField.Text = "";
                mfdTextBox.Text = "";
                expTextBox.Text = "";
                //insertItemsSqlDataSource.DataBind();
                //Response.Write("Item Added");
            }



        }


    }
}