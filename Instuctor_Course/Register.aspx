<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Instuctor_Course.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="py-5 bg-light">
        <div class="row">
        <div class="col-1"></div>
        <h2 class="col-1">Registration</h2>
        <div class="col-2 alert alert-warning alert-dismissible fade show" role="alert" id="alert" visible="false" runat="server">
            <strong>Falied!</strong> Something is wrong.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
        </div>
    </div>
    <div class="form-group row mb-1">
        <label class="col-form-label col-form-label-sm col-1 d-flex justify-content-end">Email : </label>
        <div class="col-4">
            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="UserName" />
        </div>
    </div>
    <div class="form-group row mb-2">
        <label class="col-form-label col-form-label-sm col-1 d-flex justify-content-end">Password : </label>
        <div class="col-4">
            <asp:TextBox TextMode="Password" runat="server" CssClass="form-control form-control-sm" ID="Password" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-1">
        </div>
        <div class="col-4">
            <asp:Button CssClass="btn btn-outline-primary btn-sm" ID="CreateUser" runat="server" Text="Register" OnClick="CreateUser_Click" />
        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
