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
                    RefreshGridView();
            }
        }

        protected void bt_signOut_Click(object sender, EventArgs e)
        {
            SignOut();
        }

        protected void bt_goToLogList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\UsersActions.aspx");
        }

        protected void dv_userssList_ModeChanged(object sender, EventArgs e)
        {
            bool v = ((UserData)Session["currUser"]).IsAdmin;
            if (dv_userssList.CurrentMode == DetailsViewMode.Insert && !v)
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
            RefreshGridView();
        }

        protected void dv_userssList_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (((UserData)Session["currUser"]).UserId.ToString() == gv_usersList.SelectedValue.ToString())
                SignOut();
            else
                RefreshGridView();
        }

        protected void dv_userssList_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            RefreshGridView();
        }

        private void SignOut()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            System.Web.Security.FormsAuthentication.RedirectToLoginPage();
        }

    }
}