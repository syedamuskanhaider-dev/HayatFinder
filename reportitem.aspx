<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reportitem.aspx.cs" Inherits="HayatFinder.reportitem" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="report-wrapper">
    <div class="report-card">
        <h2 class="report-title">Report an Item</h2>

        <asp:Panel ID="pnlReportForm" runat="server">
            <div class="report-row">
                <div class="report-col">
                    <!-- Item Status -->
                    <div class="report-form-group">
                        <label class="report-label">Item Status</label><br />
                        <asp:RadioButton ID="rdoLost" runat="server" GroupName="Status" Text="Lost" />
                        <asp:RadioButton ID="rdoFound" runat="server" GroupName="Status" Text="Found" />
                        <asp:CustomValidator 
                            ID="cvStatus" 
                            runat="server" 
                            ErrorMessage="Please select item status." 
                            ForeColor="Red"
                            ClientValidationFunction="validateStatus" 
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>

                    <!-- Item Name -->
                    <div class="report-form-group">
                        <label class="report-label">Item Name</label>
                        <asp:TextBox ID="txtItemName" runat="server" CssClass="report-input" TextMode="SingleLine" placeholder="e.g., iPhone 14 Pro"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="rfvItemName" 
                            runat="server" 
                            ControlToValidate="txtItemName" 
                            ErrorMessage="Item Name is required." 
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>

                    <!-- Category -->
                    <div class="report-form-group">
                        <label class="report-label">Category</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="report-input">
                            <asp:ListItem Text="Select a category" Value=""></asp:ListItem>
                            <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>
                            <asp:ListItem Text="Bags & Necessities" Value="Bags & Necessities"></asp:ListItem>
                            <asp:ListItem Text="Documents" Value="Documents"></asp:ListItem>
                            <asp:ListItem Text="Accessories" Value="Accessories"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvCategory"
                            runat="server"
                            ControlToValidate="ddlCategory"
                            InitialValue=""
                            ErrorMessage="Please select a category."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>

                    <!-- Date -->
                    <div class="report-form-group">
                        <label class="report-label">Date</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="report-input" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="rfvDate" 
                            runat="server" 
                            ControlToValidate="txtDate" 
                            ErrorMessage="Please select a date." 
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>
                </div>

                <div class="report-col">
                    <!-- Description -->
                    <div class="report-form-group">
                        <label class="report-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="report-input report-textarea" TextMode="MultiLine" Rows="5" placeholder="Describe the item..."></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="rfvDescription" 
                            runat="server" 
                            ControlToValidate="txtDescription" 
                            ErrorMessage="Description is required." 
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>

                    <!-- Location -->
                    <div class="report-form-group">
                        <label class="report-label">Location</label>
                        <asp:DropDownList  ID="ddlLocation" runat="server" CssClass="report-input">
                            <asp:ListItem Text="Select a UOG location" Value=""></asp:ListItem>
                            <asp:ListItem Text="Al-Jazari Block" Value="Al-Jazari Block"></asp:ListItem>
                            <asp:ListItem Text="Al-Hawarazmi Block" Value="Al-Hawarazmi Block"></asp:ListItem>
                            <asp:ListItem Text="Ibn-e-Sina Block" Value="Ibn-e-Sina Block"></asp:ListItem>
                            <asp:ListItem Text="Umar-al-Hayam Block" Value="Umar-al-Hayam Block"></asp:ListItem>
                            <asp:ListItem Text="Arfa-Karim Block" Value="Arfa-Karim Block"></asp:ListItem>
                            <asp:ListItem Text="Jabir-bin-Hayan" Value="Jabir-bin-Hayan"></asp:ListItem>
                            <asp:ListItem Text="SADA Department" Value="SADA Department"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="ddlLocation"
                            InitialValue=""
                            ErrorMessage="Please select a UOG location."
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="validator"/>
                    </div>

                    <!-- Contact -->
                    <div class="report-form-group">
                        <label class="report-label">Contact Information</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="report-input" TextMode="SingleLine" placeholder="Email or phone number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact" ErrorMessage="Contact is required." ForeColor="Red" Display="Dynamic" CssClass="validator"/>
                        <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContact" ValidationExpression="^((0\d{9})|([a-zA-Z0-9._%+-]+@uog\.edu\.pk))$" ErrorMessage="Enter a valid UOG email or Pakistani phone number." ForeColor="Red" Display="Dynamic" CssClass="validator"/>
                    </div>
                     <label class="report-label">Upload Photo</label>
<div class="report-upload-box" id="uploadBox">
    
    <span id="uploadText">Click or drag a file to upload</span>
    <asp:FileUpload ID="fuPhoto" runat="server" CssClass="report-file-input" onchange="previewPhoto(this)" />
     <asp:RequiredFieldValidator 
        ID="rfvPhoto" 
        runat="server" 
        ControlToValidate="fuPhoto"
        ErrorMessage="Please upload a photo."
        Display="Dynamic" 
        ForeColor="Red"
         CssClass="validator" />
    <!-- Pure client-side preview for upload box -->
    <img id="imgClientPreview" src="#" style="display:none; max-width:100%; height:auto; border-radius:12px;" />

</div>


                </div>
            </div>

            <!-- Submit/Cancel Buttons -->
            <div class="report-button-group">
                <asp:Button ID="btnSubmitReport" runat="server" CssClass="report-submit-btn" Text="Submit Report" OnClick="btnSubmitReport_Click"  />
                <asp:Label ID="lblstatus" runat="server" ForeColor="Red" CssClass="validator"></asp:Label>
                <asp:Button ID="btnCancel" runat="server" CssClass="report-cancel-btn" Text="Cancel" OnClientClick="resetForm(); return false;" />
            </div>
        </asp:Panel>
    </div>
</div>

<!-- SUCCESS POPUP MODAL -->
<div id="successModal" class="success-modal">
    <div class="success-modal-content">
        <h3>Item Reported Successfully!</h3>
        <p>Your item details have been submitted.</p>
        <asp:Image ID="imgSuccess" runat="server" CssClass="report-image-preview" Visible="false" />
        <button class="success-ok-btn" onclick="closeSuccessModal()">OK</button>
    </div>
</div>

<script>
    function closeSuccessModal() {
        document.getElementById("successModal").style.display = "none";
    }

    // Client-side validation for Item Status radio buttons
    function validateStatus(sender, args) {
        var rdoLost = document.getElementById('<%= rdoLost.ClientID %>');
        var rdoFound = document.getElementById('<%= rdoFound.ClientID %>');
        args.IsValid = rdoLost.checked || rdoFound.checked;
    }

    // Preview uploaded photo
    function previewPhoto(input) {
        var preview = document.getElementById('imgClientPreview');
        var uploadText = document.getElementById('uploadText');

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                uploadText.style.display = 'none';
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            preview.style.display = 'none';
            uploadText.style.display = 'block';
        }
    }

    function resetForm() {
        var panel = document.getElementById('<%= pnlReportForm.ClientID %>');
        if (!panel) return;

        panel.querySelectorAll("input, textarea, select").forEach(el => {
            if (el.type === "radio" || el.type === "checkbox") el.checked = false;
            else if (el.type === "file") el.value = "";
            else if (el.type !== "submit" && el.type !== "button" && el.type !== "reset") el.value = "";
        });

        panel.querySelectorAll("select").forEach(sel => sel.selectedIndex = 0);

        // Hide client-side preview image
        var imgClientPreview = document.getElementById('imgClientPreview');
        if (imgClientPreview) imgClientPreview.style.display = 'none';

        var uploadText = document.getElementById('uploadText');
        if (uploadText) uploadText.style.display = 'block';
    }




    function resetForm() {
        var panel = document.getElementById('<%= pnlReportForm.ClientID %>');
    if (!panel) return;

    panel.querySelectorAll("input, textarea, select").forEach(el => {
        if (el.type === "radio" || el.type === "checkbox") el.checked = false;
        else if (el.type === "file") el.value = "";
        else if (el.type !== "submit" && el.type !== "button" && el.type !== "reset") el.value = "";
    });

    panel.querySelectorAll("select").forEach(sel => sel.selectedIndex = 0);

   

        var imgClientPreview = document.getElementById('imgClientPreview');
        if (imgClientPreview) imgClientPreview.style.display = 'none';

        var uploadText = document.getElementById('uploadText');
        if (uploadText) uploadText.style.display = 'block';
    }

</script>
</asp:Content>
