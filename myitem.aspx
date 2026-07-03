<%@ Page Title="My Items" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="myItem.aspx.cs" Inherits="HayatFinder.myitem" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="page-title">My Posted Items</h2>
     <div class="container">
    <asp:Repeater  ID="rptMyItems" runat="server" OnItemCommand="rptMyItems_ItemCommand">
        <ItemTemplate>
            <div class="item-card">
                <!-- 3-dot menu top-right -->
                <div class="menu-container">
                    <span class="menu-dots" onclick="toggleMenu(this)">⋮</span>
                    <div class="menu-options">
                        <asp:LinkButton ID="btnComplete" runat="server"
                            CommandName="Complete"
                            CommandArgument='<%# Eval("ReportId") %>'>
                            Mark as Completed
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnDelete" runat="server"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("ReportId") %>'>
                            Delete
                        </asp:LinkButton>
                    </div>
                </div>
                 <div class="item-image">
                <!-- Item image -->
                <img src='<%# Eval("PhotoPath") %>' alt="Item Image" />
                     </div>
                 <div class="item-info">
                <!-- Item info -->
                <h3><%# Eval("ItemName") %></h3>
                <p><b>Category:</b> <%# Eval("Category") %></p>
                <p><b>Description:</b> <%# Eval("Description") %></p>
                <p><b>Status:</b> <%# Eval("ItemStatus") %></p>
                <p><b>Location:</b> <%# Eval("Location") %></p>
                      </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
    <script>
        function toggleMenu(el) {
            const menu = el.nextElementSibling;
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
            document.addEventListener("click", function handler(e) {
                if (!el.contains(e.target)) {
                    menu.style.display = "none";
                    document.removeEventListener("click", handler);
                }
            });
        }
    </script>

</asp:Content>
