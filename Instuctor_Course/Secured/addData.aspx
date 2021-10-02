<%@ Page Title="Add Data" Language="C#" MasterPageFile="~/Template.Master" ClientIDMode="AutoID" AutoEventWireup="true" CodeBehind="addData.aspx.cs" Inherits="Instuctor_Course.Secured.addData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/buttonStyle.css" rel="stylesheet" />
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $("#<%:insertDob%>").datepicker({ format: "yyyy-mm-dd" });
             
            $("#<%:SDateIn%>").datepicker({ format: "yyyy-mm-dd" });
           
            $("#<%:InsertEndDate%>").datepicker({ format: "yyyy-mm-dd" });

            
         })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:UpdateProgress runat="server">
        <ProgressTemplate>
            <div class="d-flex justify-content-end mr-3">
                <div class="spinner-border text-danger" role="status">
                    <span class="sr-only"></span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <div class="row">
                <div class="col-12">
                    <a class="btn btn-link" href="/Secured/MasterDetailsView.aspx">View Details</a>
                    <h2>Instructors</h2>

                    <asp:ListView ID="lvInstuctor" runat="server" DataKeyNames="InstructorID" DataSourceID="dsInstructor" InsertItemPosition="FirstItem" OnItemDeleted="lvInstuctor_ItemDeleted" OnItemInserted="lvInstuctor_ItemInserted" OnItemUpdated="lvInstuctor_ItemUpdated">

                        <EditItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="InstructorIDLabel1" runat="server" Text='<%# Eval("InstructorID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="InstructorNameEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="InstructorNameEd"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="IEdit"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="EmailEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator ID="emailRequired" ControlToValidate="EmailEd"
                                        runat="server" ErrorMessage="Please Enter a E-mail!" CssClass="text-danger"
                                        ValidationGroup="IEdit" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid Email!" ControlToValidate="EmailEd" ValidationGroup="IEdit"
                                        CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="SalaryEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Salary") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="SalaryEd"
                                        runat="server" ErrorMessage="Please Enter Salary!" CssClass="text-danger"
                                        ValidationGroup="IEdit"></asp:RequiredFieldValidator>
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton" ValidationGroup="IEdit"
                                        CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Update">
                                    <i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CausesValidation="false" CssClass="btn btn-sm btn-outline-secondary"
                                        runat="server" CommandName="Cancel">
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

                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="InstructorNameIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="InstructorNameIn"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="Iinsert"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="EmailIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="EmailIn"
                                        runat="server" ErrorMessage="Please Enter a E-mail!" CssClass="text-danger"
                                        ValidationGroup="Iinsert" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid Email!" ControlToValidate="EmailIn" ValidationGroup="Iinsert"
                                        CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="SalaryIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Salary") %>' />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="SalaryIn" ValidationGroup="Iinsert"
                                        ErrorMessage="Invalid Format!" CssClass="text-danger" Type="Double"></asp:CompareValidator>
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="InsertButton" ValidationGroup="Iinsert"
                                        CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Insert">
                                <i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CausesValidation="false" CssClass="btn btn-sm btn-outline-secondary" runat="server" CommandName="Cancel">
                                <i class="bi bi-x-square"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">



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

                                    <asp:LinkButton ID="EditButton" CausesValidation="false"
                                        CssClass="btn btn-sm btn-outline-primary" runat="server" CommandName="Edit">
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

                                                    <th runat="server">Instructor ID</th>
                                                    <th runat="server">Instructor Name</th>
                                                    <th runat="server">Email</th>
                                                    <th runat="server">Salary</th>
                                                    <th class="text-center">.....</th>
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
                                    <td runat="server" class="d-flex justify-content-center">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True"
                                                    ShowLastPageButton="True" FirstPageText="<<" LastPageText=">>"
                                                    NextPageText=">" PreviousPageText="<" ButtonCssClass="btn btn-sm btn-ouline-patrol" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>


                    </asp:ListView>
                </div>

                <%-- Course List View --%>

                <div class="col-12">
                    <h2>Courses</h2>
                    <asp:ListView ID="lvCourse" runat="server" DataKeyNames="CourseID" DataSourceID="dsCourse2" InsertItemPosition="FirstItem" OnItemDeleted="lvCourse_ItemDeleted" OnItemInserted="lvCourse_ItemInserted" OnItemUpdated="lvCourse_ItemUpdated">

                        <EditItemTemplate>
                            <tr style="">
                               
                                <td>
                                    <asp:Label ID="CourseIDLabel1" runat="server" Text='<%# Eval("CourseID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="InstructorIDTextBox" runat="server" Text='<%# Bind("InstructorID") %>' />
                                </td>
                                 <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton" CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Update"><i class="bi bi-plus-square"></i></asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-outline-secondary" runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
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
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="InstructorIDTextBox" runat="server" Text='<%# Bind("InstructorID") %>' />
                                </td>
                                 <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="InsertButton" CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Insert"><i class="bi bi-plus-square"></i></asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-outline-secondary" runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
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
                                    <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" runat="server" CommandName="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                                    <asp:LinkButton ID="EditButton" CssClass="btn btn-sm btn-outline-primary" runat="server" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" class="table">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer"  class="table table-bordered">
                                           <thead class="theadColor">
                                                <tr runat="server" style="">
                                                    <th runat="server">Course ID</th>
                                                    <th runat="server">Course Name</th>
                                                    <th runat="server">Instructor ID</th>
                                                    <th runat="server"></th>
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
                                    <td runat="server" class="d-flex justify-content-center">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField
                                                    ButtonType="Button"
                                                    ShowFirstPageButton="True"
                                                    ShowLastPageButton="True"
                                                    FirstPageText="<<"
                                                    LastPageText=">>"
                                                    NextPageText=">"
                                                    PreviousPageText="<" ButtonCssClass="btn btn-sm btn-ouline-patrol" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        

                    </asp:ListView>
                    
                    <%--<asp:ListView ID="lvCourse" runat="server" DataKeyNames="CourseID" DataSourceID="dsCourse" InsertItemPosition="FirstItem">

                        <EditItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="CourseIDLabel1" runat="server" Text='<%# Eval("CourseID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CourseNameEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("CourseName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="CourseNameEd"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="CEdit"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="InstructorIDTextBox" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorID") %>' />
                                </td>
                                 <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton" ValidationGroup="CEdit"
                                        CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Update">
                                    <i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CausesValidation="false" CssClass="btn btn-sm btn-outline-secondary"
                                        runat="server" CommandName="Cancel">
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

                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="CourseNameIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("CourseName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="CourseNameIn"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="Cinsert"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="InstructorIDTextBox"
                                        DataTextField="InstructorName"
                                        DataValueField="InstructorID"
                                        DataSourceID="dsInstructor"
                                        CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("InstructorID") %>'>
                                    </asp:DropDownList>
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="InsertButton" ValidationGroup="Cinsert"
                                        CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Insert">
                                <i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CssClass="btn btn-sm btn-outline-secondary"
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
                                    <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" runat="server" CommandName="Delete">
                                <i class="bi bi-trash"></i></asp:LinkButton>
                                    <asp:LinkButton ID="EditButton" CausesValidation="false"
                                        CssClass="btn btn-sm btn-outline-primary" runat="server" CommandName="Edit">
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
                                    <td runat="server" class="d-flex justify-content-center">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button"
                                                    ShowFirstPageButton="True" ShowLastPageButton="True"
                                                    FirstPageText="<<" LastPageText=">>" NextPageText=">"
                                                    PreviousPageText="<" ButtonCssClass="btn btn-sm btn-ouline-patrol" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>--%>
                </div>

                <%-- Student List View --%>

                <div class="col-12">
                    <h2>Students</h2>
                    <asp:ListView ID="lvStudents" runat="server" DataKeyNames="StudentID" DataSourceID="dsStudent" InsertItemPosition="FirstItem" OnItemDeleted="lvStudents_ItemDeleted" OnItemInserted="lvStudents_ItemInserted" OnItemUpdated="lvStudents_ItemUpdated">

                        <EditItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="StudentIDLabel1" runat="server" Text='<%# Eval("StudentID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="StudentNameEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("StudentName") %>' />
                                    <asp:RequiredFieldValidator ID="StudentRequired" ControlToValidate="StudentNameEd"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="SEdit"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="dateEdit" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("DOB","{0:yyyy-MM-dd}") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="dateEdit"
                                        runat="server" ErrorMessage="Please Enter a Date!" CssClass="text-danger"
                                        ValidationGroup="SEdit"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="EmailEd" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="EmailEd"
                                        runat="server" ErrorMessage="Please Enter a E-mail!" CssClass="text-danger"
                                        ValidationGroup="SEdit" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid Email!" ControlToValidate="EmailEd" ValidationGroup="SEdit"
                                        CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton" ValidationGroup="SEdit"
                                        CssClass="btn btn-sm btn-outline-success mr-2"
                                        runat="server" CommandName="Update"><i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CausesValidation="false"
                                        CssClass="btn btn-sm btn-outline-secondary"
                                        runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
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
                                    <asp:TextBox ID="StudentNameIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("StudentName") %>' />
                                    <asp:RequiredFieldValidator ID="StudentRequiredIn" ControlToValidate="StudentNameIn"
                                        runat="server" ErrorMessage="Please Enter a Name!" CssClass="text-danger"
                                        ValidationGroup="SInsert"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="DOBIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("DOB","{0:yyyy-MM-dd}") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="DOBIn"
                                        runat="server" ErrorMessage="Please Enter a Date!" CssClass="text-danger"
                                        ValidationGroup="SInsert"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="EmailIn" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="EmailIn"
                                        runat="server" ErrorMessage="Please Enter a E-mail!" CssClass="text-danger"
                                        ValidationGroup="SInsert" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid Email!" ControlToValidate="EmailIn" ValidationGroup="SInsert"
                                        CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="InsertButton" ValidationGroup="SInsert"
                                        CssClass="btn btn-sm btn-outline-success mr-2"
                                        runat="server" CommandName="Insert"><i class="bi bi-save"></i></asp:LinkButton>

                                    <asp:LinkButton ID="CancelButton" CausesValidation="false"
                                        CssClass="btn btn-sm btn-outline-secondary"
                                        runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Eval("StudentID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="DeleteButton" CssClass="btn btn-sm btn-outline-danger mr-2" runat="server" CommandName="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                                    <asp:LinkButton ID="EditButton" CssClass="btn btn-sm btn-outline-primary" runat="server" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
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
                                                    <th runat="server">Student ID</th>
                                                    <th runat="server">Student Name</th>
                                                    <th runat="server">Date of Birth</th>
                                                    <th runat="server">Email</th>
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
                                    <td runat="server" class="d-flex justify-content-center">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField
                                                    ButtonType="Button"
                                                    ShowFirstPageButton="True"
                                                    ShowLastPageButton="True"
                                                    FirstPageText="<<"
                                                    LastPageText=">>"
                                                    NextPageText=">"
                                                    PreviousPageText="<" ButtonCssClass="btn btn-sm btn-ouline-patrol" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>

                </div>

                <%-- Student Course List View Data --%>
                <div class="col-12">
                    <h2>Students Course</h2>
                    <asp:ListView ID="lvCourseStudent" runat="server" DataKeyNames="Id" DataSourceID="dsStudentCourse" InsertItemPosition="LastItem">
                        
                        <EditItemTemplate>
                            <tr style="">

                                
                                <td>
                                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />

                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="StartDateED" runat="server" Text='<%# Bind("StartDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="FinishDateED" runat="server" Text='<%# Bind("FinishDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton"  CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Update"><i class="bi bi-plus-square"></i></asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton"  CssClass="btn btn-sm btn-outline-secondary" runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
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

                                
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="StudentDateIn" runat="server" Text='<%# Bind("StartDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="FinishDateIn" runat="server" Text='<%# Bind("FinishDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="InsertButton"  CssClass="btn btn-sm btn-outline-success mr-2" runat="server" CommandName="Insert"><i class="bi bi-plus-square"></i></asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton"  CssClass="btn btn-sm btn-outline-secondary" runat="server" CommandName="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">

                                
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Eval("StudentID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FinishDateLabel" runat="server" Text='<%# Eval("FinishDate","{0:yyyy-MM-dd}") %>' />
                                </td>
                                <td class="d-flex justify-content-center">
                                    <asp:LinkButton ID="DeleteButton"  CssClass="btn btn-sm btn-outline-danger mr-2" runat="server" CommandName="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                                    <asp:LinkButton ID="EditButton"  CssClass="btn btn-sm btn-outline-primary" runat="server" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
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
                                                    <th runat="server">Id</th>
                                                    <th runat="server">Student ID</th>
                                                    <th runat="server">Course ID</th>
                                                    <th runat="server">Start Date</th>
                                                    <th runat="server">Finish Date</th>
                                                    <th></th>
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
                                    <td runat="server" class="d-flex justify-content-center">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField
                                                    ButtonType="Button"
                                                    ShowFirstPageButton="True"
                                                    ShowLastPageButton="True"
                                                    FirstPageText="<<"
                                                    LastPageText=">>"
                                                    NextPageText=">"
                                                    PreviousPageText="<" ButtonCssClass="btn btn-sm btn-ouline-patrol" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                       

                    </asp:ListView>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


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

    <asp:SqlDataSource ID="dsCourse2" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [Courses] ([CourseName], [InstructorID]) VALUES (@CourseName, @InstructorID)" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [InstructorID] = @InstructorID WHERE [CourseID] = @CourseID">
            <DeleteParameters>
                <asp:Parameter Name="CourseID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="InstructorID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="InstructorID" Type="Int32" />
                <asp:Parameter Name="CourseID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    <%-- Students Sql Data Source --%>

    <asp:SqlDataSource ID="dsStudent" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Students] ([StudentName], [DOB], [Email]) VALUES (@StudentName, @DOB, @Email)" SelectCommand="SELECT * FROM [Students]" UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [DOB] = @DOB, [Email] = @Email WHERE [StudentID] = @StudentID">
        <DeleteParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StudentName" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentName" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="StudentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <%-- Student Course Sql Data Source --%>

    <asp:SqlDataSource ID="dsStudentCourse" runat="server" ConnectionString="<%$ ConnectionStrings:studentCourse %>" DeleteCommand="DELETE FROM [StudentCourse] WHERE [Id] = @Id" InsertCommand="INSERT INTO [StudentCourse] ([StudentID], [CourseID], [StartDate], [FinishDate]) VALUES (@StudentID, @CourseID, @StartDate, @FinishDate)" SelectCommand="SELECT * FROM [StudentCourse]" UpdateCommand="UPDATE [StudentCourse] SET [StudentID] = @StudentID, [CourseID] = @CourseID, [StartDate] = @StartDate, [FinishDate] = @FinishDate WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="FinishDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="FinishDate" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
