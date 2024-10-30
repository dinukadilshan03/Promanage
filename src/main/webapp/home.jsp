<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ProManage - Employee Management System</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/home.css">
    
    <style>
    body {
    font-family: 'Poppins', sans-serif; /* Font style */
    background: linear-gradient(135deg, #e0f7fa 30%, #e1f5fe 90%); /* Gradient background */
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
}

/* Header styles */
header {
    background-color: #39ace7; /* Bright Blue background for header */
    color: white; /* White text color */
    padding: 40px 0; /* Vertical padding for header */
    text-align: center; /* Center text alignment */
    font-size: 36px; /* Header font size */
    letter-spacing: 1px; /* Space between letters */
}

/* Navigation bar styles */
nav {
    display: flex; /* Flexbox for navigation layout */
    justify-content: center; /* Center navigation links */
    background-color: #0784b5; /* Teal background */
    padding: 20px 0; /* Vertical padding for nav */
}

/* Navigation link styles */
nav a {
    color: white; /* White text for links */
    padding: 12px 25px; /* Padding around links */
    text-decoration: none; /* Remove underline from links */
    font-size: 18px; /* Font size for links */
    margin: 0 20px; /* Horizontal margin between links */
    display: flex; /* Flexbox for icon and text alignment */
    align-items: center; /* Center icon and text vertically */
    transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth background color change on hover */
}

/* Icon styles in navigation links */
nav a i {
    margin-right: 8px; /* Space between icon and text */
    font-size: 18px; /* Icon size */
}

/* Hover effect for navigation links */
nav a:hover {
    background-color: #39ace7; /* Lighter Teal on hover */
    border-radius: 5px; /* Rounded corners on hover */
    transform: scale(1.05); /* Slightly enlarge on hover */
}

/* General section styles */
section {
    padding: 50px 20px; /* Padding for sections */
    max-width: 1200px; /* Maximum width for sections */
    margin: auto; /* Center sections horizontally */
}

/* Flexbox container for sections */
.section-container {
    display: flex; /* Flexbox for layout */
    justify-content: space-between; /* Space between items */
    align-items: flex-start; /* Align items at the top */
    margin-bottom: 50px; /* Space below sections */
}

/* Content area in section */
.section-content {
    flex-basis: 60%; /* Occupy 60% of the section */
}

/* Image area in section */
.section-image {
    flex-basis: 35%; /* Occupy 35% of the section */
    text-align: center; /* Center images */
}

/* Styles for images in section */
.section-image img {
    max-width: 100%; /* Responsive image size */
    border-radius: 8px; /* Rounded corners for images */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
}

/* Specific styles for the About Us section */
.about-us {
    background-color: #ffffff; /* White background */
    padding: 30px; /* Padding for About Us */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
    margin-bottom: 50px; /* Space below section */
}

/* Specific styles for the Vision section */
.vision {
    background-color: #ffe0b2; /* Light Orange background */
    padding: 30px; /* Padding for Vision */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
    margin-bottom: 50px; /* Space below section */
}

/* Specific styles for the Contact Us section */
.contact-us {
    background-color: #fce4ec; /* Light Pink background */
    padding: 30px; /* Padding for Contact Us */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
    margin-bottom: 50px; /* Space below section */
}

/* Styles for the Features section */
.features {
    padding: 30px; /* Padding for Features */
    border-radius: 8px; /* Rounded corners */
    margin-bottom: 50px; /* Space below section */
    background: linear-gradient(135deg, #e1f5fe, #e0f7fa); /* Soft gradient background */
}

/* Heading styles */
h2 {
    color: #414c50; /* Dark color for headings */
    font-size: 28px; /* Heading font size */
    margin-bottom: 20px; /* Space below headings */
}

/* Paragraph styles */
p {
    font-size: 16px; /* Paragraph font size */
    line-height: 1.6; /* Line height for readability */
    color: #666; /* Gray color for text */
}

/* Unordered list styles */
ul {
    padding-left: 20px; /* Indent for lists */
}

/* List item styles */
li {
    margin-bottom: 10px; /* Space between list items */
    color: #333; /* Dark color for list items */
}

/* Map iframe styles */
.map {
    margin: auto; /* Center map */
    width: 100%; /* Full width */
    height: 400px; /* Fixed height */
    border: 0; /* Remove border */
    border-radius: 8px; /* Rounded corners */
}

/* Footer styles */
footer {
    background-color: #0784b5; /* Darker background */
    color: white; /* White text color */
    text-align: center; /* Center text alignment */
    padding: 40px 20px; /* Padding for footer */
    display: flex; /* Flexbox for footer layout */
    flex-direction: column; /* Column layout */
    align-items: center; /* Center items */
}

/* Footer paragraph styles */
footer p {
    margin: 10px 0; /* Vertical margin for paragraphs */
    color: white;
}

/* Footer icon container styles */
.footer-icons {
    margin-top: 15px; /* Space above icons */
}

/* Footer icon link styles */
.footer-icons a {
    color: white; /* White color for icon links */
    margin: 0 10px; /* Horizontal margin for icons */
    font-size: 20px; /* Icon font size */
    transition: color 0.3s ease; /* Smooth color change on hover */
}

/* Hover effect for footer icons */
.footer-icons a:hover {
    color: #39ace7; /* Light Blue color on hover */
}

/* Features Section Styles */
.features {
    text-align: center; /* Center text in Features section */
    padding: 50px 20px; /* Padding for Features section */
    background: linear-gradient(135deg, #e1f5fe, #e0f7fa); /* Soft gradient background */
}

/* Heading styles in Features section */
.features h2 {
    font-size: 28px; /* Font size for heading */
    margin-bottom: 30px; /* Space below heading */
    color: #414c50; /* Dark color */
}

/* Flexbox container for feature cards */
.features-container {
    display: flex; /* Flexbox for layout */
    justify-content: space-between; /* Space between cards */
    flex-wrap: wrap; /* Allow wrapping of cards */
    gap: 20px; /* Gap between cards */
    max-width: 1200px; /* Max width for container */
    margin: auto; /* Center container */
}

/* Individual feature card styles */
.feature-card {
    background-color: #ffffff; /* White background */
    padding: 30px 20px; /* Padding for feature cards */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
    text-align: center; /* Center text in cards */
    flex: 1 1 18%; /* Flex properties for responsiveness */
    min-width: 250px; /* Minimum width for cards */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transformation on hover */
}

/* Hover effect for feature cards */
.feature-card:hover {
    transform: translateY(-10px); /* Lift card on hover */
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
}

/* Icon styles for feature cards */
.feature-icon {
    font-size: 50px; /* Size of icons */
    color: #0784b5; /* Teal color for icons */
    margin-bottom: 20px; /* Space below icons */
}

/* Heading styles for feature cards */
.feature-card h3 {
    font-size: 20px; /* Font size for card headings */
    color: #414c50; /* Dark color for headings */
}

/* Paragraph styles for feature cards */
.feature-card p {
    color: #666; /* Gray color for text */
    line-height: 1.5; /* Line height for readability */
}
    </style>


</head>
<body>

    <header>
        <h1>ProManage - Empowering Your Workforce</h1>
    </header>

    <nav>
        <a href="#"><i class="fas fa-home"></i>Home</a>
        <a href="#features"><i class="fas fa-briefcase"></i>Features</a>
        <a href="#about"><i class="fas fa-users"></i>About Us</a>
        <a href="#vision"><i class="fas fa-bullseye"></i>Vision</a>
        <a href="#contact"><i class="fas fa-envelope"></i>Contact Us</a>
        <a href="#map"><i class="fas fa-map-marker-alt"></i>Our Location</a>
        <a href="login.jsp"><i class="fas fa-sign-in-alt"></i>Login</a>
    </nav>

    <!-- Features Section -->
    <section class="features" id="features">
        <h2>Our Features</h2>
        <div class="features-container">
            <div class="feature-card">
                <i class="fas fa-database feature-icon"></i>
                <h3>Data Visibility</h3>
                <p>Increase employee data visibility across regions with centralized management.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-lock feature-icon"></i>
                <h3>Secure Management</h3>
                <p>Ensure secure data management and privacy for your workforce.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-cogs feature-icon"></i>
                <h3>Customizable Solutions</h3>
                <p>Manage your workforce your way with flexible tools and features.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-user-shield feature-icon"></i>
                <h3>Employee Empowerment</h3>
                <p>Empower employees with self-service portals and easy-to-access data.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-mobile-alt feature-icon"></i>
                <h3>Mobile Accessibility</h3>
                <p>Access and manage your employee database on the go from any device.</p>
            </div>
        </div>
    </section>

    <section id="about" class="about-us">
        <div class="section-container">
            <div class="section-content">
                <h2>About Us</h2>
                <p>ProManage is a leading employee management system designed to streamline HR processes in organizations. From task management to payroll and leave requests, we provide managers and employees with tools to enhance productivity and maintain a healthy work-life balance. Our system is built with cutting-edge technology to ensure a secure, reliable, and scalable solution for any business size.</p>
            </div>
            <div class="section-image">
                <img src="images/about.jpg" alt="About Us Image">
            </div>
        </div>
    </section>

    <section id="vision" class="vision">
        <div class="section-container">
            <div class="section-content">
                <h2>Our Vision</h2>
                <p>Our vision is to become the world's most trusted employee management platform, empowering businesses to create efficient and inclusive workplaces. We believe in continuous improvement and innovation to meet the evolving needs of our clients.</p>
            </div>
            <div class="section-image">
                <img src="images/vision.webp" alt="Our Vision Image">
            </div>
        </div>
    </section>

    <!-- Contact Us Section with Image -->
    <section id="contact" class="contact-us">
        <div class="section-container">
            <div class="section-content">
                <h2>Contact Us</h2>
                <p>If you have any questions, feedback, or need assistance, feel free to reach out to our team:</p>
                <div class="contact-info">
                    <i class="fas fa-envelope contact-icon"></i>
                    <p>Email: support@promanage.com</p>
                </div>
                <div class="contact-info">
                    <i class="fas fa-phone contact-icon"></i>
                    <p>Phone: (123) 456-7890</p>
                </div>
                <div class="contact-info">
                    <i class="fas fa-map-marker-alt contact-icon"></i>
                    <p>Office: 123 Main Street, Anytown, USA</p>
                </div>
            </div>
            <div class="section-image">
                <img src="images/contact.jpg" alt="Contact Us Image">
            </div>
        </div>
    </section>

    <section id="map">
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15843.220366504154!2d79.95569442548312!3d6.913892590749342!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae256db1a6771c5%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology!5e0!3m2!1sen!2slk!4v1728568207471!5m2!1sen!2slk" width="1200" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</section>
	
    <footer>
        <p>&copy; 2024 ProManage. All rights reserved.</p>
        <div class="footer-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>

</body>
</html>
