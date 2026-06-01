<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Pages_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">About Us</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-lg-8 mx-auto text-center mt-5">
            <h2 class="mb-4" style="color: var(--primary-blue);">About SmartWash</h2>
            <p class="lead text-muted">
                SmartWash is a modern car wash center dedicated to providing the best care for your vehicle.
                We use eco-friendly products and state-of-the-art equipment to ensure a spotless finish.
            </p>
            <hr class="my-5" />
            <div class="row text-start">
                <div class="col-md-4">
                    <i class="bi bi-droplet-fill text-info fs-1"></i>
                    <h4 class="mt-3">Eco-Friendly</h4>
                    <p>We use biodegradable soaps and water-saving technologies.</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-clock-fill text-info fs-1"></i>
                    <h4 class="mt-3">Fast & Efficient</h4>
                    <p>Our experienced team ensures your car is ready in no time without compromising quality.</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-star-fill text-info fs-1"></i>
                    <h4 class="mt-3">Premium Quality</h4>
                    <p>From ceramic coatings to interior detailing, we offer premium services.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
