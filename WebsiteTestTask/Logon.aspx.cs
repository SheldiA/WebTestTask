using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using WebsiteTestTask.App_Code;

namespace WebsiteTestTask
{
    public partial class Logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lg_loginData_Authenticate(object sender, AuthenticateEventArgs e)
        {
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (((UserData)Session["currUser"]).IsUserValid((SQLiteClass)Application["usersDB"], lg_loginData.UserName, lg_loginData.Password))
            {
                //Session["usersListDS"] = 1;//(System.Data.DataSet)((SQLiteClass)Application["usersDB"]).ReadFromBD("SELECT user_id,name FROM user");
                ((LogsList)Application["logsList"]).AddLog(((UserData)Session["currUser"]).UserName,"log on");
                FormsAuthentication.RedirectFromLoginPage(lg_loginData.UserName, false);
                Response.Redirect("~\\UsersEditor.aspx");
            }
        }
    }
}