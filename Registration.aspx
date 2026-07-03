<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HayatFinder.Registration1"  UnobtrusiveValidationMode=None %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <!-- Left side: Registration Form -->
        <div class="form-section">
            <div class="form-box">
                <h2>Create Account</h2>
                <p>Join HayatFinder today and help students to find their items. </p>

                <!-- Full Name -->
                
                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field" placeholder="Full Name"></asp:TextBox>
               <asp:RequiredFieldValidator
    ID="rfvFullName"
    runat="server"
    ControlToValidate="txtFullName"
    ErrorMessage="Full Name is required."
    CssClass="validator"
Display="Dynamic"
      />
                <asp:RegularExpressionValidator

    ID="revFullName"
    runat="server"
    ControlToValidate="txtFullName"
    ErrorMessage="Only letters and spaces are allowed."
    ValidationExpression="^[A-Za-z\s]+$"
    ForeColor="Red"
    Display="Dynamic" 
           CssClass="validator"           />
                <!-- Email -->
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder=" University Email" TextMode="Email"></asp:TextBox>
                <!-- Email Validator -->
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
                <!-- Password -->
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" placeholder="Password" TextMode="Password"></asp:TextBox>
                <!-- Password Validator -->
                                                <asp:RequiredFieldValidator
    ID="rfvPassword"
    runat="server"
    ControlToValidate="txtPassword"
    ErrorMessage="Password is required."
    CssClass="validator"
Display="Dynamic"
                   />            

<asp:RegularExpressionValidator 
    ID="revPassword" 
    runat="server" 
    ControlToValidate="txtPassword"
    ErrorMessage="Password must be strong."
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$"
    ForeColor="Red"
    CssClass="validator"
    Display="Dynamic"
    />
                <!-- Confirm Password -->
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-field" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator
    ID="revConfirmPassword"
    runat="server"
    ControlToValidate="txtConfirmPassword"
    ErrorMessage="Confirm your password."
    CssClass="validator"
Display="Dynamic"
                   />            
               <!-- Compare Validator for Confirm Password -->
<asp:CompareValidator 
    ID="cvConfirmPassword" 
    runat="server" 
    ControlToValidate="txtConfirmPassword"
    ControlToCompare="txtPassword"
    ErrorMessage="Passwords do not match."
    ForeColor="Red" 
    Display="Dynamic"/>

                <!-- Sign Up Button -->
                <asp:Button ID="btnRegister" runat="server" CssClass="btn-signup" Text="Sign Up" onclick="btnRegister_Click" />

                <!-- Sign In Redirect -->
                <div class="signin-link">
                    Already have an account? <a href="login.aspx">Login</a>
                </div>
            </div>
        </div>

        <!-- Right side: Image Section -->
        <div class="image-section">
            <img src="images/uog3.png" alt="Register Illustration" />
            <div class="overlay-box">
                <h2>Join HayatFinder</h2>
                <p>"Because every lost item deserves to be found."</p>
            </div>
        </div>
    </div>
</asp:Content>
