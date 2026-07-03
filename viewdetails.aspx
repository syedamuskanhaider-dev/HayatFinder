<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="viewdetails.aspx.cs" Inherits="HayatFinder.viewdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="item-card1">
        <!-- Back Button -->
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-back" OnClick="btnBack_Click" />

        <!-- Image Section -->
        <div class="item-image1">
            <asp:Image ID="imgItem" runat="server" />
        </div>

        <!-- Info Section -->
        <div class="item-info1">
            <!-- Title -->
            <div class="item-title">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </div>

            <!-- Category -->
            <div class="item-category">
                <strong>Category:</strong> <asp:Label ID="lblCategory" runat="server"></asp:Label>
            </div>

            <!-- Description -->
            <div class="item-description">
                <strong>Description:</strong> <asp:Label ID="lblDescription" runat="server"></asp:Label>
            </div>

            <!-- Status -->
            <div class="item-status">
                <strong>Status:</strong> <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </div>

            <!-- Location -->
            <div class="item-location">
                <strong>Location:</strong> <asp:Label ID="lblLocation" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
