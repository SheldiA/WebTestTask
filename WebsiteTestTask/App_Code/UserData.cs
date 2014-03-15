﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WebsiteTestTask.App_Code
{
    public class UserData
    {
        private string userName;
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private long userId = -1;
        public long UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        private bool isAdmin = false;
        public bool IsAdmin 
        {
            get { return isAdmin; }
            set { isAdmin = value; }
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