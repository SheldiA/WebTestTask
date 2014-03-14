using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebsiteTestTask
{
    public partial class UsersActions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = ((WebsiteTestTask.App_Code.LogsList)Application["logsList"]).ShowAllLogs();
                if (ds.Tables.Count > 0)
                {
                    int i = ds.Tables[0].Rows.Count;
                    int k = ds.Tables[0].Columns.Count;
                    gv_actionsList.DataSource = ds;
                    gv_actionsList.DataBind();
                }
            }
        }
    }
}