using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Instuctor_Course
{
    public partial class InstructorsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lvInstructor_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "UnSelect")
            {
                lvInstructor.SelectedIndex = -1;
            }
        }

        protected void lvInstructor_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvInstructor_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            this.DataBind();
        }

        protected void lvInstructor_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            this.DataBind();
        }
        //protected string InsertDate
        //{
        //    get
        //    {
        //        return lvCourse.InsertItem.FindControl("StartDateInsert").ClientID;
        //    }
        //}
        //protected string EditDate
        //{
        //    get
        //    {
        //        if (lvCourse.EditItem == null) return "";
        //        else
        //        {
        //            return lvCourse.EditItem.FindControl("StartDateEdit").ClientID;
        //        }
        //    }
        //}

    }
}