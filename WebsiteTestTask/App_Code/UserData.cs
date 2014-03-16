using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WebsiteTestTask.App_Code
{
    public class UserData
    {
        /*CREATE TABLE user(
         * user_id INTEGER PRIMARY KEY,
         * name TEXT UNIQUE NOT NULL,
         * password TEXT NOT NULL, 
         * email TEXT NOT NULL, 
         * company TEXT, 
         * type TEXT DEFAULT 'user',
         * start_date TEXT DEFAULT '{0}')", (new DateTime(1900, 1, 1)).ToString());*/

        private string userName;
        public string UserName
        {
            get { return userName; }
        }

        private long userId = -1;
        public long UserId
        {
            get { return userId; }
        }

        private bool isAdmin = false;
        public bool IsAdmin 
        {
            get { return isAdmin; }
        }

        public UserData()
        {
        }

        public DataSet GetUsersList(SQLiteClass sql)
        {
            string query = "SELECT * FROM user";
            if (!isAdmin)
                query += " WHERE user_id=" + userId;
            return sql.ReadFromBD(query);
        }

        public bool IsUserValid(SQLiteClass sql,string userName,string password)
        {
            bool result = false;

            if(sql != null)
            {                
                string query = String.Format("SELECT * FROM user WHERE name = '{0}' AND password = '{1}'",userName,password);
                DataSet ds = sql.ReadFromBD(query);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && IsDateCorrect((string)ds.Tables[0].Rows[0]["start_date"]))
                {
                    userId = (long)ds.Tables[0].Rows[0]["user_id"];
                    isAdmin = ((string)ds.Tables[0].Rows[0]["type"] == "admin") ? true : false;
                    this.userName = userName;
                    result = true;
                }
            }

            return result;
        }

        public void ChangeData(string userName,string type)
        {
            if (this.userName != userName)
                this.userName = userName;
            isAdmin = (type == "admin") ? true : false;
        }

        private bool IsDateCorrect(string date)
        {
            bool result = true;

            if(date != "" && DateTime.Now.CompareTo(DateTime.Parse(date)) < 0)
            {
                result = false;
            }

            return result;
        }
    }
}