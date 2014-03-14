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
            lg_loginData.RememberMeText = Session.SessionID;
        }

        protected void lg_loginData_Authenticate(object sender, AuthenticateEventArgs e)
        {
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (((UserData)Session["currUser"]).IsUserValid((SQLiteClass)Application["usersDB"], lg_loginData.UserName, lg_loginData.Password))
            {
                FormsAuthentication.RedirectFromLoginPage(lg_loginData.UserName, false);
                Response.Redirect("~\\UsersEditor.aspx");
            }
        }
    }
}