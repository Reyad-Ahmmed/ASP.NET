<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Instuctor_Course.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="bg-light py-5">
        <div class="row">
            <div class="col-1"></div>
            <h2 class="col-1">Log In</h2>
            <div class="col-2 alert alert-warning alert-dismissible fade show" role="alert" id="alert" visible="false" runat="server">
              <strong>Falied!</strong> Something is wrong.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
        </div>
        </div>
        <div class="row">
            <div class="col-1"></div>
            
        </div>
        <div class="row form-group mb-1">
            <div class="col-1">
                <label class="col-form-label col-form-label-sm d-flex justify-content-end">Email : </label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="UserName" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row form-group mb-2">
            <div class="col-1">
                <label class="col-form-label col-form-label-sm d-flex justify-content-end">Password : </label>
            </div>
            <div class="col-4">
                <asp:TextBox TextMode="Password" ID="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-1"></div>
            <div class="col-4">
                <asp:Button CssClass="btn btn-outline-primary btn-sm" ID="Signin" runat="server" Text="Sign in" OnClick="LogIn_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
