using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebsiteTestTask
{
    public partial class UsersEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebsiteTestTask.App_Code.SQLiteClass sql = (WebsiteTestTask.App_Code.SQLiteClass)Application["usersDB"];
            if(sql != null)
            {
                DataSet ds = sql.ReadFromBD("SELECT * FROM user");
                if (ds.Tables.Count > 0)
                {
                    gv_usersList.DataSource = ds;
                    gv_usersList.DataBind();
                }
            }
        }

        protected void bt_signOut_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}