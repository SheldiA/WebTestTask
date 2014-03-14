using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SQLite;

namespace WebsiteTestTask.App_Code
{
    public class SQLiteClass
    {
        private SQLiteConnection sqliteConnection;

        public SQLiteClass(string path)
        {
            //SQLiteConnection.CreateFile(path);
            string connectionStr = String.Format("Data Source={0}", path);
            sqliteConnection = new SQLiteConnection(connectionStr);
        }

        public bool ExecuteQuery(string query)
        {
            bool result = false;
            try
            {
                sqliteConnection.Open();
                SQLiteCommand sqliteCommand = sqliteConnection.CreateCommand();
                sqliteCommand.CommandText = query;
                sqliteCommand.ExecuteNonQuery();
                result = true;
            }
            catch (SQLiteException ex)
            {

            }
            finally
            {
                if (sqliteConnection.State == ConnectionState.Open)
                    sqliteConnection.Close();
            }
            return result;
        }

        public DataSet ReadBD(string query)
        {
            DataSet ds = new DataSet();
            try
            {
                sqliteConnection.Open();
                SQLiteDataAdapter adapter = new SQLiteDataAdapter(query, sqliteConnection);
                adapter.Fill(ds);
            }
            catch
            {

            }
            finally
            {
                if (sqliteConnection.State == ConnectionState.Open)
                    sqliteConnection.Close();
            }
            return ds;
        }
    }
}