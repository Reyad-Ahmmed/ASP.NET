<%@ Page Title="Master View" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="MasterDetailsView.aspx.cs" Inherits="Instuctor_Course.Secured.MasterDetailsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/buttonStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h2>Instructors</h2>
            <a class="btn btn-sm btn-ouline-patrol mb-1" href="/Secured/addData.aspx">Add Data</a>
        </div>

        <%-- Instructor List View Data --%>

        <div class="col-12">
            <asp:ListView ID="lvInstructor" runat="server" DataSourceID="dsInstructor" DataKeyNames="InstructorID" OnItemCommand="lvInstructor_ItemCommand">


                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="selectButton" CssClass="btn btn-sm btn-ouline-violet"
                                runat="server" CommandName="Select" CausesValidation="false">
                                 <i class="bi bi-check-lg"></i></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="InstructorIDLabel" runat="server" Text='<%# Eval("InstructorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InstructorNameLabel" runat="server" Text='<%# Eval("InstructorName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary","{0:0.00}") %>' />
                        </td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-bordered">
                                    <thead class="theadColor">
                                        <tr runat="server" style="">
                                            <th>Select Options</th>
                                            <th runat="server">Instructor ID</th>
                                            <th runat="server">Instructor Name</th>
                                            <th runat="server">Email</th>
                                            <th runat="server">Salary</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </tbody>

                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" class=" d-flex justify-content-end">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField
                                            ButtonType="Button"
                                            ShowFirstPageButton="True"
                                            ShowLastPageButton="True" 
                                            FirstPageText="<<" 
                                            LastPageText=">>" 
                                            NextPageText=">" 
                                            PreviousPageText="<" 
                                            ButtonCssClass="btn btn-sm btn-ouline-violet"/>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: rgb(238, 232, 232)">
                        <td>
                            <asp:LinkButton ID="unselectButton" CssClass="btn btn-outline-secondary btn-sm"
                                runat="server" CommandName="UnSelect" CausesValidation="false">
                                <i class="bi bi-x-lg"></i></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="InstructorIDLabel" runat="server" Text='<%# Eval("InstructorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InstructorNameLabel" runat="server" Text='<%# Eval("InstructorName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary","{0:0.00}") %>' />
                        </td>

                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td colspan="4">
                            <h5>Courses</h5>
                            <asp:ListView ID="lvCourse" runat="server" DataKeyNames="CourseID" DataSourceID="dsCourse">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr>

                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                        </td>
                                        <td class="d-flex justify-content-center">
                                            <asp:HyperLink ID="viewDetails" CssClass="btn btn-link " NavigateUrl='<%# Eval("CourseID","~/Secured/SingleCourseStudents.aspx?cid={0}") %>' runat="server"><i class="bi bi-list-ul p-2"></i> View Students</asp:HyperLink>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" class="table">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" class="table table-bordered table-striped">
                                                    <thead class="theadColor">
                                                        <tr runat="server" style="">
                                                            <th runat="server">Course ID</th>
                                                            <th runat="server">Course Name</th>
                                                            <th runat="server" class="text-center">Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                       
                                        <tr runat="server">
                                            <td runat="server" class=" d-flex justify-content-end">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField
                                                            ButtonType="Button"
                                                            ShowFirstPageButton="True"
                                                            ShowLastPageButton="True" 
                                                            FirstPageText="<<" 
                                                            LastPageText=">>" 
                                                            NextPageText=">" 
                                                            PreviousPageText="<" 
                                                            ButtonCssClass="btn btn-sm btn-ouline-violet"/>
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">

                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="InstructorIDLabel" runat="server" Text='<%# Eval("InstructorID") %>' />
                                        </td>

                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                        </td>
                    </tr>

                </SelectedItemTemplate>

            </asp:ListView>
        </div>
    </div>

    <asp:SqlDataSource ID="dsInstructor" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" DeleteCommand="DELETE FROM [Instructors] WHERE [InstructorID] = @InstructorID" InsertCommand="INSERT INTO [Instructors] ([InstructorName], [Email], [Salary]) VALUES (@InstructorName, @Email, @Salary)" SelectCommand="SELECT * FROM [Instructors]" UpdateCommand="UPDATE [Instructors] SET [InstructorName] = @InstructorName, [Email] = @Email, [Salary] = @Salary WHERE [InstructorID] = @InstructorID">
        <DeleteParameters>
            <asp:Parameter Name="InstructorID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InstructorName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Salary" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InstructorName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Salary" Type="Decimal" />
            <asp:Parameter Name="InstructorID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsCourse" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [Courses] ([CourseName], [InstructorID]) VALUES (@CourseName, @InstructorID)" SelectCommand="SELECT * FROM [Courses] WHERE ([InstructorID] = @InstructorID)" UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [InstructorID] = @InstructorID WHERE [CourseID] = @CourseID">
        <DeleteParameters>
            <asp:Parameter Name="CourseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="InstructorID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lvInstructor" Name="InstructorID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="InstructorID" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
