<%@ Page Title="Find your vacation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JTBVacationBooking.Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero">
        <div class="hero-copy">
            <p class="eyebrow">YOUR JOURNEY STARTS HERE</p>
            <h1>Make your next getaway <span>unforgettable.</span></h1>
            <p>Search flights and cruises in one convenient place. Enter your trip details to explore available vacation options.</p>
        </div>
        <div class="hero-stamp">Discover<br /><strong>More</strong></div>
    </section>

    <section class="search-card">
        <div class="section-heading">
            <div>
                <p class="eyebrow">PLAN YOUR TRIP</p>
                <h2>Where would you like to go?</h2>
            </div>
            <span class="step-tag">01 · Trip details</span>
        </div>

        <asp:ValidationSummary ID="SearchValidationSummary" runat="server"
            CssClass="validation-summary" ValidationGroup="VacationSearch"
            HeaderText="Please correct the following:" />

        <div class="form-grid">
            <div class="field">
                <label for="<%= DepartureCountry.ClientID %>">Departure country</label>
                <asp:TextBox ID="DepartureCountry" runat="server" CssClass="form-control" MaxLength="80" placeholder="e.g. Jamaica" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DepartureCountry" ValidationGroup="VacationSearch" ErrorMessage="Enter your departure country." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= DepartureCity.ClientID %>">Departure city</label>
                <asp:TextBox ID="DepartureCity" runat="server" CssClass="form-control" MaxLength="80" placeholder="e.g. Kingston" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DepartureCity" ValidationGroup="VacationSearch" ErrorMessage="Enter your departure city." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= DestinationCountry.ClientID %>">Destination country</label>
                <asp:TextBox ID="DestinationCountry" runat="server" CssClass="form-control" MaxLength="80" placeholder="e.g. United States" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DestinationCountry" ValidationGroup="VacationSearch" ErrorMessage="Enter your destination country." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= DestinationCity.ClientID %>">Destination city</label>
                <asp:TextBox ID="DestinationCity" runat="server" CssClass="form-control" MaxLength="80" placeholder="e.g. Miami" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DestinationCity" ValidationGroup="VacationSearch" ErrorMessage="Enter your destination city." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= StartDate.ClientID %>">Start date</label>
                <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate" ValidationGroup="VacationSearch" ErrorMessage="Choose a start date." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= EndDate.ClientID %>">End date</label>
                <asp:TextBox ID="EndDate" runat="server" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EndDate" ValidationGroup="VacationSearch" ErrorMessage="Choose an end date." CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="field">
                <label for="<%= Adults.ClientID %>">Number of adults</label>
                <asp:DropDownList ID="Adults" runat="server" CssClass="form-control">
                    <asp:ListItem Text="1 adult" Value="1" />
                    <asp:ListItem Text="2 adults" Value="2" Selected="True" />
                    <asp:ListItem Text="3 adults" Value="3" />
                    <asp:ListItem Text="4 adults" Value="4" />
                    <asp:ListItem Text="5 adults" Value="5" />
                    <asp:ListItem Text="6 adults" Value="6" />
                    <asp:ListItem Text="7 adults" Value="7" />
                    <asp:ListItem Text="8 adults" Value="8" />
                </asp:DropDownList>
            </div>
        </div>

        <asp:Label ID="SearchMessage" runat="server" CssClass="message-error" EnableViewState="false" />
        <asp:Button ID="SearchButton" runat="server" Text="Search available vacations "
            CssClass="primary-button" ValidationGroup="VacationSearch" OnClick="SearchButton_Click" />
        <p class="form-note">Flight and cruise availability will be retrieved from the connected booking systems.</p>
    </section>
</asp:Content>
