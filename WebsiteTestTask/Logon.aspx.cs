using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

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
            FormsAuthentication.RedirectFromLoginPage(lg_loginData.UserName, false);
            Response.Redirect("~\\UsersEditor.aspx");
        }
    }
}