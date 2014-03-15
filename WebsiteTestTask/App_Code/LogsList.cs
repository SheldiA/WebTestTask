using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WebsiteTestTask.App_Code
{
    public class LogsList
    {
        /*"CREATE TABLE log(
         * log_id INTEGER PRIMARY KEY,
         * user_name TEXT NOT NULL, 
         * action TEXT NOT NULL,
         * action_date TEXT NOT NULL)"*/

        private SQLiteClass logDB;
        
        public LogsList(string dbPath)
        {
            logDB = new SQLiteClass(dbPath);
        }

        public bool AddLog(string user,string action)
        {
            string query = String.Format("INSERT INTO log(user_name,action,action_date) VALUES ('{0}','{1}','{2}')",user,action,DateTime.Now.ToString());
            return logDB.ExecuteQuery(query);
        }

        public DataSet ShowAllLogs()
        {
            return logDB.ReadFromBD("SELECT * FROM log");
        }

        public DataSet ApplyFilter(string userFilter,string actionFilter)
        {
            string query = String.Format("SELECT * FROM log WHERE user_name like '%{0}%' AND action like '%{1}%'",userFilter,actionFilter);
            return logDB.ReadFromBD(query);
        }
    }
}