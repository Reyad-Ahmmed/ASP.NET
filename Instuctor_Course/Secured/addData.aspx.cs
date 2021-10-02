using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Instuctor_Course.Secured
{
    public partial class addData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.Sleep(2000);
        }

        protected void lvInstuctor_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvInstuctor_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvInstuctor_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvStudents_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvStudents_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvStudents_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            this.DataBind();
        }

        protected string insertDob
        {
            get
            {
                return lvStudents.InsertItem.FindControl("DOBIn").ClientID;
            }
        }
        //protected string editDOB
        //{
        //    get
        //    {
        //        if (lvStudents.EditItem == null) return "";
        //        else
        //        {
        //            return lvStudents.EditItem.FindControl("dateEdit").ClientID;
        //        }
        //    }
        //}
        protected string SDateIn
        {
            get
            {
                return lvCourseStudent.InsertItem.FindControl("StudentDateIn").ClientID;
            }
        }

        protected string InsertEndDate
        {
            get
            {
                return lvCourseStudent.InsertItem.FindControl("FinishDateIn").ClientID;
            }
        }


        //protected string dateEdit
        //{
        //    get
        //    {
        //        if (lvCourseStudent.EditItem == null) return "";
        //        else
        //        {
        //            return lvCourseStudent.EditItem.FindControl("StartDateED").ClientID;
        //        }
        //    }
        //}
        
        //protected string SEndED
        //{
        //    get
        //    {
        //        if (lvCourseStudent.EditItem == null) return "";
        //        else
        //        {
        //            return lvCourseStudent.EditItem.FindControl("FinishDateED").ClientID;
        //        }
        //    }
        //}

        protected void lvCourse_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvCourse_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvCourse_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            this.DataBind();
        }
    }
}