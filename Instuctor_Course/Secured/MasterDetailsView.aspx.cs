using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Instuctor_Course.Secured
{
    public partial class MasterDetailsView : System.Web.UI.Page
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
    }
}