using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WebsiteTestTask.App_Code
{
    public class UserData
    {
        private string userName;
        public string UserName { get; set; }
        private long userId;
        public long UserId { get; set; }
        private bool isAdmin = false;
        public bool IsAdmin { get; set; }

        public UserData()
        {
           
        }

        public bool IsUserValid(SQLiteClass sql,string userName,string password)
        {
            bool result = false;

            if(sql != null)
            {                
                string query = String.Format("SELECT * FROM user WHERE name = '{0}' AND password = '{1}'",userName,password);
                DataSet ds = sql.ReadFromBD(query);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && DateTime.Now.CompareTo((DateTime.Parse((string)ds.Tables[0].Rows[0]["start_date"]))) > 0)
                {
                    userId = (long)ds.Tables[0].Rows[0]["user_id"];
                    isAdmin = ((string)ds.Tables[0].Rows[0]["type"] == "admin") ? true : false;
                    this.userName = userName;
                    result = true;
                }
            }

            return result;
        }
    }
}