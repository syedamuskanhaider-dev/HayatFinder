<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="feed1.aspx.cs" Inherits="HayatFinder.feed1" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Notification container -->
    <div id="toastNotification" class="toast-notification" style="display:none;">
        <span id="toastMessage"></span>
    </div>

    <!-- Search bar -->
    <div class="search-container">
        <asp:TextBox ID="txtSearch" runat="server"
            placeholder="Search for lost or found items..."
            CssClass="search-box" AutoPostBack="true"
            OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

        <asp:Button ID="btnSearch" runat="server" Text="Search"
            CssClass="search-btn" OnClick="btnSearch_Click" />
    </div>

    <section class="feed-section">
        <h2>Recent Items</h2>
         <div class="container">
        <asp:Repeater ID="rptItems" runat="server" >
            <ItemTemplate>
               
                <div class="item-card <%# Eval("ItemStatus").ToString().ToLower() %>"
                    data-poster-email='<%# Eval("Contact") %>'
                    data-item-id='<%# Eval("ReportId") %>'>

                    <div class="item-image">
                        <img src='<%# Eval("PhotoPath") %>' alt='<%# Eval("ItemName") %>' />
                        <span class='status-tag <%# Eval("ItemStatus").ToString().ToLower() %>'>
                            <%# Eval("ItemStatus").ToString().ToUpper() %>
                        </span>
                    </div>

                    <div class="item-info">
                        <h3><%# Eval("ItemName") %></h3>
                        <p><%# Eval("Description") %></p>

                        <div class="meta">
                            <span>📍 <%# Eval("Location") %></span>
                            <span>📅 <%# Eval("ReportDate", "{0:yyyy-MM-dd}") %></span>
                        </div>

                        <div class="category"><%# Eval("Category") %></div>

                        <div class="buttons">
                            <!-- Help / Claim Button -->
                            <asp:Button runat="server"
                                Text='<%# (Eval("ItemStatus").ToString() == "Found") ? "Claim my item" : "I can help" %>'
                                CssClass='<%# (Eval("ItemStatus").ToString() == "Completed") ? "btn-help disabled" : "btn-help" %>'
                                OnClientClick='<%# (Eval("ItemStatus").ToString() == "Completed") ? "return false;" :
                                    ((Eval("ItemStatus").ToString() == "Found")
                                    ? "openClaimModal(this); return false;"
                                    : "openHelpModal(this); return false;") %>'
                                data-item-id='<%# Eval("ReportId") %>'
                                data-poster-email='<%# Eval("Contact") %>' />

                            <asp:Button runat="server" Text="View Details"
    CssClass="btn-details"
    CommandArgument='<%# Eval("ReportId") %>'
    OnClick="ViewDetails_Click"
    CausesValidation="false" />

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

</div>

        <asp:Label ID="lblNoResults" runat="server"
            Text="No items found."
            CssClass="no-results-message"
            Visible="false"></asp:Label>
    </section>

   

    
    <div id="helpModal" class="help-modal" style="display:none;">
    <div class="help-modal-content">
        <h3>How can you help?</h3>
        <asp:HiddenField ID="hfPosterEmail" runat="server" />
        <asp:HiddenField ID="hfItemID" runat="server" />

        <div class="report-form-group">
            <label>Explain how you can help:</label>
            <asp:TextBox ID="txtHelpMsg" runat="server" TextMode="MultiLine"
                CssClass="report-textarea" Rows="5" ValidationGroup="vgHelp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvHelpMsg" runat="server"
                ControlToValidate="txtHelpMsg" ErrorMessage="Message is required."
                CssClass="validator" Display="Dynamic" ForeColor="Red" ValidationGroup="vgHelp" />
        </div>

        <div class="report-form-group">
            <label>Your contact info:</label>
            <asp:TextBox ID="txtHelpContact" runat="server" CssClass="report-input" ValidationGroup="vgHelp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvHelpContact" runat="server"
                ControlToValidate="txtHelpContact" ErrorMessage="Contact info is required."
                CssClass="validator" Display="Dynamic" ForeColor="Red" ValidationGroup="vgHelp" />
        </div>

        <div class="report-button-group">
            <asp:Button ID="btnSendHelp" runat="server" Text="Send"
                CssClass="report-submit-btn" OnClick="btnSendHelp_Click" ValidationGroup="vgHelp" />
            <button type="button" class="report-cancel-btn" onclick="closeHelpModal()">Cancel</button>
        </div>
    </div>
</div>
<div id="claimModal" class="help-modal" style="display:none;">
    <div class="help-modal-content">
        <h3>Send a Claim Request</h3>
        <asp:HiddenField ID="hfClaimPosterEmail" runat="server" />
        <asp:HiddenField ID="hfClaimItemID" runat="server" />

        <div class="report-form-group">
            <label>Explain your claim:</label>
            <asp:TextBox ID="txtClaimMsg" runat="server" TextMode="MultiLine"
                CssClass="report-textarea" Rows="5" ValidationGroup="vgClaim"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClaimMsg" runat="server"
                ControlToValidate="txtClaimMsg" ErrorMessage="Claim message is required."
                CssClass="validator" Display="Dynamic" ForeColor="Red" ValidationGroup="vgClaim" />
        </div>

        <div class="report-form-group">
            <label>Your contact info:</label>
            <asp:TextBox ID="txtClaimContact" runat="server" CssClass="report-input" ValidationGroup="vgClaim"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClaimContact" runat="server"
                ControlToValidate="txtClaimContact" ErrorMessage="Contact info is required."
                CssClass="validator" Display="Dynamic" ForeColor="Red" ValidationGroup="vgClaim" />
        </div>

        <div class="report-button-group">
            <asp:Button ID="btnSendClaim" runat="server" Text="Send Request"
                CssClass="report-submit-btn" OnClick="btnSendClaim_Click" ValidationGroup="vgClaim" />
            <button type="button" class="report-cancel-btn" onclick="closeClaimModal()">Cancel</button>
        </div>
    </div>
  
</div>
     
          
<div id="messageModal" class="success-modal" style="display:none;">
    <div class="success-modal-content">
        <h3 id="modalTitle">Message</h3>
        <p id="modalText"></p>
        <button type="button" class="success-ok-btn" onclick="closeMessageModal()">OK</button>
       </div>
</div>



    <script>
        function openHelpModal(btn) {
            document.getElementById('<%= hfPosterEmail.ClientID %>').value = btn.getAttribute('data-poster-email');
            document.getElementById('<%= hfItemID.ClientID %>').value = btn.getAttribute('data-item-id');
            document.getElementById('helpModal').style.display = 'flex';
        }

        function closeHelpModal() {
            document.getElementById('helpModal').style.display = 'none';
            document.getElementById('<%= txtHelpMsg.ClientID %>').value = '';
            document.getElementById('<%= txtHelpContact.ClientID %>').value = '';
        }

        function openClaimModal(btn) {
            document.getElementById('<%= hfClaimPosterEmail.ClientID %>').value = btn.getAttribute('data-poster-email');
            document.getElementById('<%= hfClaimItemID.ClientID %>').value = btn.getAttribute('data-item-id');
            document.getElementById('claimModal').style.display = 'flex';
        }

        function closeClaimModal() {
            document.getElementById('claimModal').style.display = 'none';
            document.getElementById('<%= txtClaimMsg.ClientID %>').value = '';
            document.getElementById('<%= txtClaimContact.ClientID %>').value = '';
        }

        function showToast(msg, isError = false) {
            var toast = document.getElementById('toastNotification');
            toast.innerText = msg;
            toast.classList.toggle('error', isError);
            toast.style.display = 'block';
            setTimeout(() => toast.style.display = 'none', 3000);
        }
        function openMessageModal(title, text, isError = false) {
            const modal = document.getElementById('messageModal');
            const titleEl = document.getElementById('modalTitle');
            const textEl = document.getElementById('modalText');
            const okBtn = modal.querySelector('.success-ok-btn');

            titleEl.textContent = title;
            textEl.textContent = text;

            //  Color difference for success vs error
            if (isError) {
                titleEl.style.color = "#d32f2f";   // red for error
                okBtn.style.backgroundColor = "#b71c1c";
            } else {
                titleEl.style.color = "#1e7d32";   // green for success
                okBtn.style.backgroundColor = "#07417D";
            }

            modal.style.display = "flex";
        }

        function closeMessageModal() {
            document.getElementById("messageModal").style.display = "none";

            // Optional cleanup: close help/claim modals too
            document.getElementById("helpModal").style.display = "none";
            document.getElementById("claimModal").style.display = "none";
        }


      

            function closeSuccessModal() {
                document.getElementById('successModal').style.display = 'none';
}
    </script>



</asp:Content>
