<%@ Page Title="" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HayatFinder.landingaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <section class="hero" id="hero">
    <div class="hero-bg"></div>
    <div class="hero-glow"></div>

    <div class="hero-content">
        <h1 class="hero-title"> Welcome to HayatFinder</h1>
        <p class="hero-sub">
          
Your trusted campus Lost & Found system.
Find your lost belongings or help others by reporting found items,all in one place.
        </p>
        <a href="Registration.aspx" class="btn-hero">Get Started</a>
    </div>

   
           <div class="hero-image-stack">
        <img src="images/head1.png" alt="Lost Item 1" class="stack-img img1" />
        <img src="images/head2.png" alt="Lost Item 2" class="stack-img img2" />
        <img src="images/head3.png" alt="Lost Item 3" class="stack-img img3" />
        <img src="images/head4.png" alt="Lost Item 4" class="stack-img img4" />
    </div>
</section>


        <!-- About Section -->
        <section id="about" class="info-section">
            <div class="info-text">
                <h2>What is HayatFinder?</h2>
                <p>HayatFinder is your trusted platform for reporting and finding lost or found items within the campus. 
                   We connect students through a secure and easy-to-use system designed to reunite 
                   items with their rightful owners.</p>
            </div>
            <img src="images/whatis.png" alt="About HayatFinder" />
        </section>

        <!-- Importance Section -->
        <section id="importance" class="importance">
            <h2>Why Lost Link is Important</h2>
            <div class="importance-boxes">
                <div class="box">
                    <h3>Community Trust</h3>
                    <p>We build a reliable community where honesty is valued and rewarded.</p>
                </div>
                <div class="box">
                    <h3>Simple & Organized</h3>
                    <p>Students can easily post, browse, and filter items — making it simple to 
                       find what’s been lost or connect with the finder.</p>
                </div>
                <div class="box">
                    <h3>Reliable Communication</h3>
                    <p>Our system lets Students securely contact each other to verify and return 
                       lost belongings safely.</p>
                </div>
            </div>
        </section>

        <!-- How It Works Section -->
        <section id="howitworks" class="how-it-works">
            <h2>How to Use Lost Link</h2>
            <div class="steps">
                <div class="step">
                    <span class="step-number">1</span>
                    <p>Sign up and log in to your account.</p>
                </div>
                <div class="step">
                    <span class="step-number">2</span>
                    <p>Post your lost or found item with clear details and an image.</p>
                </div>
                <div class="step">
                    <span class="step-number">3</span>
                    <p>Browse items to find matches or contact other users.</p>
                </div>
                <div class="step">
                    <span class="step-number">4</span>
                    <p>Communicate securely and reunite with your item.</p>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section id="faq" class="faq">
            <h2>Frequently Asked Questions</h2>

            <div class="faq-item">
                <input type="checkbox" id="faq1" />
                <label for="faq1">How can I post a lost item?<span class="arrow">▼</span></label>
                <div class="answer">Go to “Report Lost Item” on the dashboard, fill in details, and submit your report.</div>
            </div>

            <div class="faq-item">
                <input type="checkbox" id="faq2" />
                <label for="faq2">Can I edit or delete my report?<span class="arrow">▼</span></label>
                <div class="answer">Yes, you can edit or delete your post anytime from your profile.</div>
            </div>

            <div class="faq-item">
                <input type="checkbox" id="faq3" />
                <label for="faq3">Is there any verification process?<span class="arrow">▼</span></label>
                <div class="answer">We verify users through email and item verification steps to ensure safety.</div>
            </div>

            <div class="faq-item">
                <input type="checkbox" id="faq4" />
                <label for="faq4">Is HayatFinder free?<span class="arrow">▼</span></label>
                <div class="answer">Yes! HayatFinder is completely free for all users.</div>
            </div>
        </section>

</asp:Content>
