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
                else
                {
                    DataSet ds = ((WebsiteTestTask.App_Code.LogsList)Application["logsList"]).GetAllLogs();
                    FillGridView(ds);
                }
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
            FillGridView(ds);
        }

        private void FillGridView(DataSet ds)
        {
            if (ds.Tables.Count > 0)
            {
                gv_actionsList.DataSource = ds;
                gv_actionsList.DataBind();
                Session["LogsDataSet"] = ds;
            }
        }

        protected void gv_actionsList_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataSet ds = Session["LogsDataSet"] as DataSet;
            if(ds != null)
            {
                DataTable dt = ds.Tables[0];
                if (dt != null)
                {
                    dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                    gv_actionsList.DataSource = dt;
                    gv_actionsList.DataBind();
                }
            }            
            
        }

        private string GetSortDirection(string column)
        {
            string sortDirection = "ASC";
            string sortExpression = ViewState["SortExpression"] as string;

            if(sortExpression != null)
            {
                if(sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if (lastDirection != null && lastDirection == "ASC")
                        sortDirection = "DESC";
                }
            }

            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }
    }
}