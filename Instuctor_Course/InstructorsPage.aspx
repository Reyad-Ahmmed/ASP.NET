<%@ Page Title="Instructor" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="InstructorsPage.aspx.cs" Inherits="Instuctor_Course.InstructorsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/buttonStyle.css" rel="stylesheet" />
    
    <script>
        <%--$(() => {
            $("#<%= InsertDate %>").datepicker({ format: "yyyy-mm-dd" });
            var editDate = "<%:EditDate%>";
            if (editDate) {
                $(`#${editDate}`).datepicker({ format: "yyyy-mm-dd" });
            }
        })--%>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="col-12">
        <div class="col-12">
            <h2>Instructors</h2>
        </div>

        <%-- Instructor List View Data --%>

        <div class="col-12">
            <asp:ListView ID="lvInstructor" runat="server" DataSourceID="dsInstructor" DataKeyNames="InstructorID" InsertItemPosition="LastItem" OnItemCommand="lvInstructor_ItemCommand" OnItemDeleted="lvInstructor_ItemDeleted" OnItemInserted="lvInstructor_ItemInserted" OnItemUpdated="lvInstructor_ItemUpdated">

                <EditItemTemplate>
                    <tr style="">
                        <td></td>
                        <td>
                            <asp:Label ID="IidLabelEdit" runat="server" Text='<%# Eval("InstructorID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="InameEdit" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorName") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger"
                                ControlToValidate="InameEdit" ValidationGroup="Iedit"
                                ErrorMessage="Please Enter Instructor Name!"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="ImailEdit" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Please Enter Your E-mail!" ControlToValidate="ImailEdit" 
                                CssClass="text-danger" Display="Dynamic" ValidationGroup="Iedit"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ErrorMessage="Invalid Email!" ControlToValidate="ImailEdit" 
                                CssClass="text-danger"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Iedit"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="IsalaryEdit" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Salary") %>' />
                            <asp:RequiredFieldValidator ID="SalaryValidator" runat="server" ControlToValidate="IsalaryEdit" ValidationGroup="Iedit" 
                                ErrorMessage="Please Enter Your Salary!" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>
                        <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-sm btn-outline-success mr-2" 
                                runat="server" CommandName="Update" ValidationGroup="Iedit">
                                 <i class="bi bi-save"></i></asp:LinkButton>

                            <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-outline-secondary" 
                                runat="server" CommandName="Cancel" CausesValidation="false">
                                 <i class="bi bi-x-square"></i></asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td></td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="InameInsert" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorName") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger"
                                ControlToValidate="InameInsert" ValidationGroup="Iinsert"
                                ErrorMessage="Please Enter Instructor Name!"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="ImailInsert" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Please Enter Your E-mail!" ControlToValidate="ImailInsert" 
                                CssClass="text-danger" Display="Dynamic" ValidationGroup="Iinsert"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ErrorMessage="Invalid Email!" ControlToValidate="ImailInsert" 
                                CssClass="text-danger"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Iinsert"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="IsalaryInsert" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Salary") %>' />
                            <asp:RequiredFieldValidator ID="SalaryValidator2" runat="server" ControlToValidate="IsalaryInsert" ValidationGroup="Iinsert" 
                                ErrorMessage="Please Enter Your Salary!" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:LinkButton ID="InsertButton" ValidationGroup="Iinsert" 
                                CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Insert">
                                 <i class="bi bi-plus-square"></i></asp:LinkButton>

                            <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-outline-secondary" 
                                runat="server" CommandName="Cancel" CausesValidation="false">
                                 <i class="bi bi-x-square"></i></asp:LinkButton>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
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
                        <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="DeleteButton" runat="server"
                                CssClass="btn btn-sm btn-outline-danger mr-2" CommandName="Delete">
                                <i class="bi bi-trash"></i></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="false"
                                CssClass="btn btn-sm btn-outline-primary" CommandName="Edit">
                                <i class="bi bi-pencil"></i></asp:LinkButton>
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
                                            <th runat="server" class="text-center">.....</th>
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
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField
                                            ButtonType="Button"
                                            ShowFirstPageButton="True"
                                            ShowLastPageButton="True" />
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
                        <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" runat="server" CommandName="Delete">
                                 <i class="bi bi-trash"></i></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" CssClass="btn btn-sm btn-outline-primary" 
                                runat="server" CommandName="Edit" CausesValidation="false">
                                 <i class="bi bi-pencil"></i></asp:LinkButton>
                        </td>
                    </tr>
                </SelectedItemTemplate>

            </asp:ListView>
        </div>

        <%-- Course List View Data --%>

        <div class="col-12">
            <h2>Courses</h2>
        </div>
        <div class="col-12">
            <asp:ListView ID="lvCourse" runat="server" DataKeyNames="CourseID" DataSourceID="dsCourse" InsertItemPosition="LastItem">
              
                <EditItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="CourseIDEdit" runat="server" Text='<%# Eval("CourseID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CourseNameEdit" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("CourseName") %>' />
                            <asp:RequiredFieldValidator ID="CEd" ValidationGroup="cEdit"
                                ControlToValidate="CourseNameEdit" CssClass="text-danger"
                                runat="server" ErrorMessage="Please Enter a Course Name!"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="InstructorIDEdit" DataTextField="InstructorName" 
                                DataValueField="InstructorID" DataSourceID="dsInstructor"
                                CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorID") %>'></asp:DropDownList>

                             <asp:RequiredFieldValidator ID="idVE" ValidationGroup="cEdit"
                                ControlToValidate="InstructorIDEdit" CssClass="text-danger"
                                runat="server" ErrorMessage="Please Enter a ID!"></asp:RequiredFieldValidator>
                        </td>
                        <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-sm btn-outline-success mr-2" ValidationGroup="cEdit"
                                runat="server" CommandName="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            <asp:LinkButton ID="CancelButton"  CssClass="btn btn-sm btn-outline-secondary" 
                                runat="server" CommandName="Cancel" CausesValidation="false"><i class="bi bi-x-square"></i></asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="CourseNameInsert" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("CourseName") %>' />
                            <asp:RequiredFieldValidator ID="courseV" ValidationGroup="cInsert"
                                ControlToValidate="CourseNameInsert" CssClass="text-danger"
                                runat="server" ErrorMessage="Please Enter a Course Name!"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="InstructorIDInsert" DataTextField="InstructorName" 
                                DataValueField="InstructorID" DataSourceID="dsInstructor"
                                CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorID") %>'></asp:DropDownList>

                            <asp:RequiredFieldValidator ID="idV" ValidationGroup="cInsert"
                                ControlToValidate="InstructorIDInsert" CssClass="text-danger"
                                runat="server" ErrorMessage="Please Enter a Course Name!"></asp:RequiredFieldValidator>
                        </td>
                        <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="InsertButton"  CssClass="btn btn-sm btn-outline-success mr-2" 
                                runat="server" CommandName="Insert" ValidationGroup="cInsert">
                                <i class="bi bi-plus-square"></i></asp:LinkButton>
                            <asp:LinkButton ID="CancelButton"  CssClass="btn btn-sm btn-outline-secondary" 
                                runat="server" CommandName="Cancel" CausesValidation="false">
                                <i class="bi bi-x-square"></i></asp:LinkButton>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
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
                         <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" 
                                runat="server" CommandName="Delete" >
                                <i class="bi bi-trash"></i></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" CssClass="btn btn-sm btn-outline-primary" 
                                runat="server" CommandName="Edit" CausesValidation="false"><i class="bi bi-pencil"></i></asp:LinkButton>
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
                                            <th runat="server">Instructor ID</th>
                                            <th runat="server" class="text-center">.....</th>
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
                            <td runat="server" style=""></td>
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
                         <td class="d-flex justify-content-center">
                            <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" 
                                runat="server" CommandName="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" CssClass="btn btn-sm btn-outline-primary" 
                                runat="server" CommandName="Edit" CausesValidation="false"><i class="bi bi-pencil"></i></asp:LinkButton>
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            
        </div>
    </div>

     <%-- Instructor Sql Data Source --%>

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

    <%-- Course Sql Data Source --%>

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
