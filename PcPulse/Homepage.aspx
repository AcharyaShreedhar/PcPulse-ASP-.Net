<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="PcPulse.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="homepage_container">
    <section class="hero home">
        <div class="hero_content">
            <h1>Welcome to our Online Electronics Store</h1>
            <p>Your one-stop destination for the best Electronics and Digital adventures.</p>
        </div>
    </section>
    <section class="store-overview form-group">
        <div class="col-sm-12">
            <h2>About Us</h2>
            <p>Welcome to our online electronics store! We aim to provide the latest and best quality electronics to meet your needs. Whether you're looking for smartphones, laptops, cameras, or home entertainment systems, we've got you covered. With a wide range of products from top brands, we strive to offer competitive prices and exceptional customer service.</p>
            <p>Explore our featured products and special deals to find the perfect gadgets and devices to elevate your digital experience.</p>
        </div>
    </section>

    <section class="latest-offers form-group">
        <div class="container">
            <h2>Latest Offers</h2>
            <div id="imageSlider" class="carousel slide" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#imageSlider" data-slide-to="0" class="active"></li>
                    <li data-target="#imageSlider" data-slide-to="1"></li>
                    <li data-target="#imageSlider" data-slide-to="2"></li>
                    <li data-target="#imageSlider" data-slide-to="3"></li>
                    <li data-target="#imageSlider" data-slide-to="4"></li>
                    <li data-target="#imageSlider" data-slide-to="5"></li>
                    <li data-target="#imageSlider" data-slide-to="6"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Images/MacBookPro.jpg" alt="Offer 1">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>50% off</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/DellXPS15.jpg" alt="Offer 2">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>10% off</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/HPSpectrex360.jpg" alt="Offer 3">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>10% off</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/LenovoThinkPadX1.jpg" alt="Offer 4">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>10% off</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/HPSpectrex360.jpg" alt="Offer 5">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>10% off</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/AsusROGZephyrusG14.jpg" alt="Offer 6">
                        <div class="carousel-caption">
                            <h2>Sale</h2>
                            <h3>10% off</h3>
                        </div>
                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#imageSlider" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#imageSlider" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function () {
            $('#imageSlider').carousel({
                interval: 3000 // Set the interval for auto sliding in milliseconds
            });
        });
    </script>
        </main>

</asp:Content>
