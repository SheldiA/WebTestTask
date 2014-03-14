using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteTestTask
{
    public partial class UsersEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void bt_signOut_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}