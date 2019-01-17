using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BackEndLibrary
{
    /// <summary>
    /// Responsible for reading departments into a Dictionary suitable
    /// for populating a ComboBox to be used with AutoComplete functionality.
    /// 
    /// Reads Gender types for use in a ComboBox w/o AutoComplete functionality.
    /// 
    /// Add a new patient record with information collected by a form that
    /// in the case for AutoComplete functionality gets the primary key for the
    /// selected value in the department ComboBox.
    /// 
    /// Each method is rigged with try/catch along with setting properties of
    /// the base class BaseExceptionHandler where there are properties exposed
    /// to check for issues.
    /// 
    /// </summary>
    public class AutoCompleteOperations : BaseSqlServerConnections
    {
        public AutoCompleteOperations()
        {
            DefaultCatalog = "PatientTrackerDatabase";
        }

        /// <summary>
        /// Read in all departments from database
        /// </summary>
        /// <returns>Dictionary of department names and primary key</returns>
        public Dictionary<string,int> Departments()
        {
            
            var results = new Dictionary<string,int>();
            var selectStatement = "SELECT DepartmentName, DepartmentIdentifier  FROM dbo.Department";

            try
            {
                using (var cn = new SqlConnection() {ConnectionString = ConnectionString})
                {
                    using (var cmd = new SqlCommand() {Connection = cn, CommandText = selectStatement})
                    {

                        cn.Open();

                        var reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            results.Add(reader.GetString(0),reader.GetInt32(1));
                        }
                    }
                }
            }
            catch (Exception e)
            {
                mHasException = true;
                mLastException = e;
            }

            return results;
        }
        /// <summary>
        /// Return all gender types from database
        /// </summary>
        /// <returns>all gender names and primary keys</returns>
        public List<Gender> Genders()
        {
            var results = new List<Gender>();

            var selectStatement = "SELECT GenderIdentifier,Gender FROM dbo.GenderTypes";

            try
            {
                using (var cn = new SqlConnection() { ConnectionString = ConnectionString })
                {
                    using (var cmd = new SqlCommand() { Connection = cn, CommandText = selectStatement })
                    {
                        cn.Open();
                        var reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            results.Add(new Gender() { Identifier = reader.GetInt32(0), Value = reader.GetString(1)});
                        }
                    }
                }
            }
            catch (Exception e)
            {
                mHasException = true;
                mLastException = e;
            }
            return results;
        }
        /// <summary>
        /// Add new patient and return new primary key if no errors
        /// </summary>
        /// <param name="pPatient"></param>
        /// <returns>success of adding a patient</returns>
        public bool AddPatient(Patient pPatient)
        {
            var result = false;

            var insertStatement = "INSERT INTO dbo.Patient " +
                                  "(FirstName,LastName,GenderIdentifier,DepartmentIdentifier) " +
                                  "VALUES (@FirstName,@LastName,@GenderIdentifier,@DepartmentIdentifier); " + 
                                  "SELECT CAST(scope_identity() AS int);";

            try
            {
                using (var cn = new SqlConnection() { ConnectionString = ConnectionString })
                {
                    using (var cmd = new SqlCommand() { Connection = cn, CommandText = insertStatement })
                    {
                        cmd.Parameters.AddWithValue("@FirstName", pPatient.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", pPatient.LastName);
                        cmd.Parameters.AddWithValue("@GenderIdentifier", pPatient.GenderIdentifier);
                        cmd.Parameters.AddWithValue("@DepartmentIdentifier", pPatient.DepartmentIdentifier);

                        cn.Open();

                        pPatient.Id = Convert.ToInt32(cmd.ExecuteScalar());

                        result = true;
                    }
                }
            }
            catch (Exception e)
            {
                mHasException = true;
                mLastException = e;
            }

            return result;
        }
    }
}
