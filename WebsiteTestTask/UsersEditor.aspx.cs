using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebsiteTestTask.App_Code;

namespace WebsiteTestTask
{
    public partial class UsersEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gv_usersList.DataSourceID = "";
                if (((UserData)Session["currUser"]).UserId < 0)
                    SignOut();
                else
                {
                    RefreshGridView();
                    bt_goToLogList.Visible = ((UserData)Session["currUser"]).IsAdmin;
                }
            }
        }

        protected void bt_signOut_Click(object sender, EventArgs e)
        {
            ((WebsiteTestTask.App_Code.LogsList)Application["logsList"]).AddLog(((WebsiteTestTask.App_Code.UserData)Session["currUser"]).UserName, "log out");
            SignOut();
        }

        protected void bt_goToLogList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\UsersActions.aspx");
        }

        protected void dv_userssList_ModeChanged(object sender, EventArgs e)
        {
            if (dv_userssList.CurrentMode == DetailsViewMode.Insert && !((UserData)Session["currUser"]).IsAdmin)
                dv_userssList.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void dv_userssList_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            if(e.Values["start_date"] == null)
                e.Values["start_date"] = DateTime.Now.ToString();
        }        

        private void RefreshGridView()
        {
            DataSet ds = ((UserData)Session["currUser"]).GetUsersList((SQLiteClass)Application["usersDB"]);
            if (ds.Tables.Count > 0)
            {
                gv_usersList.DataSource = ds;
                gv_usersList.DataBind();
            }
        }

        protected void dv_userssList_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lb_error.Text = "Item can't be inserted in database.";
                e.ExceptionHandled = true;

            }
            else
            {
                lb_error.Text = "";
                string userName = e.Values["name"].ToString();
                ((LogsList)Application["logsList"]).AddLog(((UserData)Session["currUser"]).UserName, "insert user " + userName);
                RefreshGridView();
            }
        }

        protected void dv_userssList_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lb_error.Text = "Item can't be deleted from database";
                e.ExceptionHandled = true;
            }
            else
            {
                lb_error.Text = "";
                string userName = e.Values["name"].ToString();
                ((LogsList)Application["logsList"]).AddLog(((UserData)Session["currUser"]).UserName, "delete user " + userName);
                if (((UserData)Session["currUser"]).UserId.ToString() == gv_usersList.SelectedValue.ToString())
                {
                    SignOut();
                    ((WebsiteTestTask.App_Code.LogsList)Application["logsList"]).AddLog(((WebsiteTestTask.App_Code.UserData)Session["currUser"]).UserName, "log out");
                }
                else
                    RefreshGridView();
            }
        }

        protected void dv_userssList_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lb_error.Text = "Item can't be updated in database";
                e.ExceptionHandled = true;
            }
            else
            {
                lb_error.Text = "";
                string userId = gv_usersList.SelectedValue.ToString();
                ((LogsList)Application["logsList"]).AddLog(((UserData)Session["currUser"]).UserName, "edit profile of user with id " + userId);
                RefreshGridView();
            }
        }

        private void SignOut()
        {            
            System.Web.Security.FormsAuthentication.SignOut();
            System.Web.Security.FormsAuthentication.RedirectToLoginPage();
        }

        protected void dv_userssList_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            if (gv_usersList.SelectedValue.ToString() == ((UserData)Session["currUser"]).UserId.ToString())
                if (!((UserData)Session["currUser"]).IsAdmin && e.OldValues["type"] != e.NewValues["type"])
                {
                    e.Cancel = true;
                    dv_userssList.ChangeMode(DetailsViewMode.ReadOnly);
                }
        }

    }
}