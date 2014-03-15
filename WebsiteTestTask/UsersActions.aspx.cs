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
    public partial class UsersActions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (((UserData)Session["currUser"]).UserId < 0)
                    SignOut();
            }
        }

        private void SignOut()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            System.Web.Security.FormsAuthentication.RedirectToLoginPage();
        }

        protected void bt_filter_Click(object sender, EventArgs e)
        {
            DataSet ds = ((WebsiteTestTask.App_Code.LogsList)Application["logsList"]).ApplyFilter(tb_usernameFilter.Text,tb_actionFilter.Text);
            if (ds.Tables.Count > 0)
            {
                gv_actionsList.DataSourceID = "";
                gv_actionsList.DataSource = ds;
                gv_actionsList.DataBind();
            }
        }
    }
}