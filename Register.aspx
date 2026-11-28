<%@ Page Title="Create account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JTBVacationBooking.Register" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="auth-layout">
        <div class="auth-intro">
            <p class="eyebrow">START EXPLORING</p>
            <h1>One account. A world of possibilities.</h1>
            <p>Create your profile to search for flights and cruises for your next vacation.</p>
        </div>
        <div class="auth-card">
            <h2>Create your account</h2>
            <p class="muted">All fields are required.</p>
            <asp:ValidationSummary ID="RegisterSummary" runat="server" CssClass="validation-summary" />
            <div class="field">
                <label for="<%= FullName.ClientID %>">Full name</label>
                <asp:TextBox ID="FullName" runat="server" CssClass="form-control" MaxLength="120" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName" ErrorMessage="Full name is required." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= Email.ClientID %>">Email address</label>
                <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email" MaxLength="254" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="Email is required." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= Password.ClientID %>">Password</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." CssClass="field-error" Display="Dynamic" />
                <span class="field-hint">At least 8 characters, including uppercase, lowercase and a number.</span>
            </div>
            <div class="field">
                <label for="<%= ConfirmPassword.ClientID %>">Confirm password</label>
                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Please confirm your password." CssClass="field-error" Display="Dynamic" />
                <asp:CompareValidator runat="server" ControlToValidate="ConfirmPassword" ControlToCompare="Password" ErrorMessage="Passwords do not match." CssClass="field-error" Display="Dynamic" />
            </div>
            <asp:Label ID="RegisterMessage" runat="server" CssClass="message-error" EnableViewState="false" />
            <asp:Button ID="RegisterButton" runat="server" Text="Create account" CssClass="primary-button full-button" OnClick="RegisterButton_Click" />
            <p class="auth-switch">Already registered? <a href="Login.aspx">Log in</a></p>
        </div>
    </section>
</asp:Content>
