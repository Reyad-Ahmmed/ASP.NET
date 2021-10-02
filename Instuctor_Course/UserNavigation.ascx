<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserNavigation.ascx.cs" Inherits="Instuctor_Course.UserNavigation" %>
<ul class="navbar-nav">
    <li class="nav-item"><a href="/Default.aspx" class="nav-link text-light"><i class="bi bi-house-fill"></i></a></li>

</ul>
<ul class="navbar-nav">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">Instructor
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Secured/MasterDetailsView.aspx">Master Detail</a></li>
            <li><a class="dropdown-item" href="/Secured/addData.aspx">Add Data</a></li>
            <li><a class="dropdown-item" href="/Report.aspx">Report</a></li>
        </ul>
    </li>

</ul>
