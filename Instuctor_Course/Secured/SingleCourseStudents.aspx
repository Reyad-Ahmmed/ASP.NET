<%@ Page Title="Course Details" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="SingleCourseStudents.aspx.cs" Inherits="Instuctor_Course.Secured.SingleStudentCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/buttonStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="dsCourse" RenderOuterTable="false">
        <HeaderTemplate>
            <h2 class="display-5 text-center">Course Information</h2>
            <div class="row bg-light mx-5 my-2">
                
        </HeaderTemplate>
        <ItemTemplate>
            <div class="col-2 fw-bold">Course Name: </div>
            <div class="col-10"> <%#Eval("CourseName") %></div>
            <div class="col-2 fw-bold">Instructor Name: </div>
            <div class="col-10"> <%#Eval("InstructorName") %></div>
            <div class="fw-bold col-2">Monthly Salary:</div> 
            <div class="col-10"><%#Eval("Salary") %></div>
            <div class="fw-bold col-2">E-mail Address:</div>
            <div class="col-10"><a href="#"><%# Eval("Email") %></a></div>

        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:FormView>
    
    <h2 class="mt-5 text-center display-5">Students</h2>
    <div class="row mx-4">
        
        <a class="btn btn-sm btn-ouline-sky ml-auto mr-3" href="MasterDetailsView.aspx"><i class="bi bi-arrow-left"></i> Back to Master View</a>
        <div class="col-12">
            
            <asp:GridView ID="dsCourseStudent" DataSourceID="dsStudentCourse" CssClass="table table-bordered my-2"
                runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" HeaderStyle-BackColor="ButtonShadow">
                <Columns>
                    <asp:BoundField DataField="StudentName" HeaderText="Students Name" SortExpression="StudentName" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Course Start Date" SortExpression="StartDate" />
                    <asp:BoundField DataField="FinishDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Course End Date" SortExpression="FinishDate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>

            </asp:GridView>
        </div>
    </div>
    
    <asp:SqlDataSource ID="dsCourse" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" SelectCommand="SELECT Instructors.InstructorID, Instructors.InstructorName, Instructors.Email, Instructors.Salary, Courses.CourseID, Courses.CourseName FROM Courses INNER JOIN Instructors ON Courses.InstructorID = Instructors.InstructorID WHERE (Courses.CourseID = @CourseID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CourseID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsStudentCourse" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" SelectCommand="SELECT StudentCourse.StartDate, StudentCourse.FinishDate, Students.StudentName, Students.DOB, Students.Email, CASE WHEN FinishDate IS NULL THEN 'Running' ELSE 'Complete' END AS Status FROM StudentCourse INNER JOIN Students ON StudentCourse.StudentID = Students.StudentID WHERE (StudentCourse.CourseID = @CourseID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CourseID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
