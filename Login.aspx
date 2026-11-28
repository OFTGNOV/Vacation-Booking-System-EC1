<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JTBVacationBooking.Login" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="auth-layout">
        <div class="auth-intro">
            <p class="eyebrow">WELCOME BACK</p>
            <h1>Your next adventure is waiting.</h1>
            <p>Log in to continue planning and booking your vacation.</p>
        </div>
        <div class="auth-card">
            <h2>Log in</h2>
            <p class="muted">Enter your account details below.</p>
            <asp:ValidationSummary ID="LoginSummary" runat="server" CssClass="validation-summary" />
            <div class="field">
                <label for="<%= Email.ClientID %>">Email address</label>
                <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email" MaxLength="254" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="Email is required." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= Password.ClientID %>">Password</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." CssClass="field-error" Display="Dynamic" />
            </div>
            <asp:Label ID="LoginMessage" runat="server" CssClass="message-error" EnableViewState="false" />
            <asp:Button ID="LoginButton" runat="server" Text="Log in to your account" CssClass="primary-button full-button" OnClick="LoginButton_Click" />
            <p class="auth-switch">New to JTB Vacation Booking? <a href="Register.aspx">Create an account</a></p>
        </div>
    </section>
</asp:Content>
