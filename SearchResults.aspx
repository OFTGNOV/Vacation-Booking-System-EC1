<%@ Page Title="Vacation search results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="JTBVacationBooking.SearchResults" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="results-heading">
        <p class="eyebrow">YOUR SEARCH</p>
        <h1>Available vacation options</h1>
        <asp:Literal ID="SearchSummary" runat="server" />
        <a href="Default.aspx" class="text-link">Click To Edit search</a>
    </section>

    <div class="results-grid">
        <section class="result-panel">
            <div class="panel-heading">
                <div><p class="eyebrow">AIR TRAVEL</p><h2>Flights</h2></div>
            </div>
            <p class="muted">Departure and return flight options will appear here.</p>
            <!-- MEMBER 2!!!!:
                 Bind departure and return flight results from the Airline web service here.
                 Keep the search parameters supplied to SearchResults.aspx.cs. -->
            <asp:PlaceHolder ID="FlightResultsPlaceholder" runat="server">
                <div class="integration-placeholder">
                    <strong>Flight results area</strong>
                    <span>Waiting for Airline System web-service integration.</span>
                </div>
            </asp:PlaceHolder>
        </section>

        <section class="result-panel">
            <div class="panel-heading">
                <div><p class="eyebrow">AT SEA</p><h2>Cruises & rooms</h2></div>
            </div>
            <p class="muted">Available cruises and room types for your dates will appear here.</p>
            <!-- MEMBER 2 !!!:
                 Bind cruise and room-type results from the Cruise Admin web service here. -->
            <asp:PlaceHolder ID="CruiseResultsPlaceholder" runat="server">
                <div class="integration-placeholder">
                    <strong>Cruise results area</strong>
                    <span>Waiting for Cruise System web-service integration.</span>
                </div>
            </asp:PlaceHolder>
        </section>
    </div>
</asp:Content>
