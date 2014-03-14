using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WebsiteTestTask
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
            myScriptResDef.Path = "~/Scripts/jquery-1.10.2.min.js";
            myScriptResDef.DebugPath = "~/Scripts/jquery-1.10.2.js";
            myScriptResDef.CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.10.2.min.js";
            myScriptResDef.CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.10.2.js";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, myScriptResDef);
            Application["usersDB"] = new WebsiteTestTask.App_Code.SQLiteClass(Server.MapPath("App_Data") + "\\UserData.db");
            Application["logsDB"] = new WebsiteTestTask.App_Code.SQLiteClass(Server.MapPath("App_Data") + "\\LogData.db");
        }

        public void Session_OnStart()
        {
            Session["currUser"] = new WebsiteTestTask.App_Code.UserData();
            Session["usersListDS"] = new System.Data.DataSet();
            //System.Web.Security.FormsAuthentication.SignOut();
        }

        public void Session_OnEnd()
        {
            System.Web.Security.FormsAuthentication.SignOut();
        }

        protected void Application_End()
        {

        }
    }
}