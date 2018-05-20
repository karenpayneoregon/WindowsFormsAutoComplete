using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BackEndLibrary
{
    public class BaseExceptionsHandler
    {
        protected bool mHasException;
        /// <summary>
        /// Indicate the last operation thrown an 
        /// exception or not
        /// </summary>
        /// <returns></returns>
        public bool HasException => mHasException;

        protected Exception mLastException;
        /// <summary>
        /// Provides access to the last exception thrown
        /// </summary>
        /// <returns></returns>
        public Exception LastException => mLastException;
        public SqlException SqlException => (SqlException)mLastException;

        /// <summary>
        /// Indicates if there was a sql related exception
        /// </summary>
        public bool HasSqlException
        {
            get
            {
                if (LastException != null)
                {
                    return LastException is SqlException;
                }
                else
                {
                    return false;
                }
            }
        }
        /// <summary>
        /// If you don't need the entire exception as in 
        /// LastException this provides just the text of the exception
        /// </summary>
        /// <returns></returns>
        public string LastExceptionMessage => LastException.Message;

        /// <summary>
        /// Indicate for return of a function if there was an 
        /// exception thrown or not.
        /// </summary>
        /// <returns></returns>
        public bool IsSuccessFul => !HasException;

        /// <summary>
        /// Returns an array of the entire exception list in reverse order
        /// (innermost to outermost exception)
        /// </summary>
        /// <param name="ex">The original exception to work off</param>
        /// <returns>Array of Exceptions from innermost to outermost</returns>
        public Exception[] InnerExceptions(Exception ex)
        {
            List<Exception> exceptions = new List<Exception>();
            exceptions.Add(ex);

            Exception currentEx = ex;
            while (currentEx.InnerException != null)
            {
                exceptions.Add(currentEx);
            }

            // Reverse the order to the innermost is first
            exceptions.Reverse();

            return exceptions.ToArray();

        }
    }

}
