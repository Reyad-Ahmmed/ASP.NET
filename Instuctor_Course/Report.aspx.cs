using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Instuctor_Course
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["studentCourse"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT *FROM Instructors", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Instructors");
            da = new SqlDataAdapter("SELECT *FROM Courses", con);
            da.Fill(ds, "Courses");
            da = new SqlDataAdapter("SELECT *FROM Students", con);
            da.Fill(ds, "Students");
            da = new SqlDataAdapter("SELECT *FROM StudentCourse", con);
            da.Fill(ds, "StudentCourse");

            CrystalReport1 report = new CrystalReport1();
            report.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = report;
            CrystalReportViewer1.RefreshReport();

        }
    }
}