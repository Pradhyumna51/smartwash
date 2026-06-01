<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Home</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="p-5 mb-4 bg-light rounded-3 shadow-sm text-center">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold" style="color: var(--primary-blue);">Welcome to SmartWash!</h1>
            <p class="col-md-8 mx-auto fs-4 text-muted">
                Premium car wash center management system. Book your car wash online and enjoy our top-class services.
            </p>
            <a href="Register.aspx" class="btn btn-cyan btn-lg px-4 mt-3">Book a Wash Now</a>
        </div>
    </div>

    <div class="row align-items-md-stretch">
        <div class="col-md-6 mb-4">
            <div class="h-100 p-5 text-white bg-dark rounded-3" style="background-color: var(--secondary-blue) !important;">
                <h2>Our Services</h2>
                <p>We provide standard wash, premium detailing, and ceramic coating to keep your vehicle shining like new.</p>
                <a class="btn btn-outline-cyan" href="About.aspx">Learn More</a>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="h-100 p-5 bg-light border rounded-3 card-custom">
                <h2>Why Choose Us?</h2>
                <p>Top-notch equipment, experienced staff, and a hassle-free online booking system. Your car deserves the best care.</p>
            </div>
        </div>
    </div>
</asp:Content>
