<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HayatFinder.login" UnobtrusiveValidationMode=None %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <!-- Left side: Login form -->
    <div class="form-section">
        <div class="form-box">
            <h2>Welcome Back</h2>
            <p>Login to your HayatFinder account</p>

            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="University Email" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator
    ID="rvfEmail"
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Email is required."
    CssClass="validator"
Display="Dynamic"
                   />   
            <asp:RegularExpressionValidator 
    ID="revEmail" 
    runat="server" 
    ControlToValidate="txtEmail"
    ErrorMessage="Invalid UOG email format."
    ValidationExpression="^\d{8}-(0\d|0\d{2}|1\d\d|160)@uog\.edu\.pk$"
    ForeColor="Red" 
    CssClass="validator"
    Display="Dynamic"/>

       <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator
    ID="rfvPassword"
    runat="server"
    ControlToValidate="txtPassword"
    ErrorMessage="Password is required."
    ForeColor="Red"
    Display="Dynamic"
                  CssClass="validator" />

            <div class="forgot-password">
    &nbsp;</div>

            <asp:Button ID="btnLogin" runat="server" CssClass="btn-signup" Text="Login" onclick="btnLogin_Click" />
            <asp:Label ID="lblerror" runat="server" forecolor="red"  CssClass="validator"></asp:Label>
            <div class="signin-link">
                Don’t have an account? <a href="Registration.aspx">Sign Up</a>
            </div>
        </div>
    </div>

    <!-- Right side: Image -->
    <div class="image-section">
        <img src="images/uog3.png" alt="Login Illustration" />
        <div class="overlay-box">
           <h2>Good to see you !</h2>
            <p>"Because every lost story deserves an ending."</p>
           
        </div>
    </div>
</div>
</asp:Content>
