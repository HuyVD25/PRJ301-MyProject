<%-- 
    Document   : Footer
    Created on : Jul 17, 2025, 4:27:31 PM
    Author     : MSI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProject</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            
            main {
                flex: 1;
                padding: 2rem;
                max-width: 1200px;
                margin: 0 auto;
            }
            
            .footer {
                background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
                color: white;
                padding: 3rem 0 1rem;
                margin-top: auto;
            }
            
            .footer-content {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 2rem;
            }
            
            .footer-main {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 2rem;
                margin-bottom: 2rem;
            }
            
            .footer-section h3 {
                color: #ecf0f1;
                margin-bottom: 1rem;
                font-size: 1.2rem;
                font-weight: 600;
                position: relative;
            }
            
            .footer-section h3::after {
                content: '';
                position: absolute;
                bottom: -5px;
                left: 0;
                width: 50px;
                height: 3px;
                background: linear-gradient(45deg, #3498db, #2980b9);
                border-radius: 2px;
            }
            
            .contact-info {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }
            
            .contact-item {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                color: #bdc3c7;
                transition: all 0.3s ease;
            }
            
            .contact-item:hover {
                color: #3498db;
                transform: translateX(5px);
            }
            
            .contact-icon {
                width: 20px;
                height: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                background: rgba(52, 152, 219, 0.1);
                border-radius: 50%;
                font-size: 0.9rem;
                flex-shrink: 0;
            }
            
            .quick-links {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .quick-links a {
                color: #bdc3c7;
                text-decoration: none;
                transition: all 0.3s ease;
                padding: 0.25rem 0;
                border-bottom: 1px solid transparent;
            }
            
            .quick-links a:hover {
                color: #3498db;
                border-bottom-color: #3498db;
                padding-left: 0.5rem;
            }
            
            .social-links {
                display: flex;
                gap: 1rem;
                flex-wrap: wrap;
            }
            
            .social-link {
                width: 40px;
                height: 40px;
                background: rgba(52, 152, 219, 0.1);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #bdc3c7;
                text-decoration: none;
                transition: all 0.3s ease;
                font-size: 1.1rem;
            }
            
            .social-link:hover {
                background: #3498db;
                color: white;
                transform: translateY(-3px);
            }
            
            .footer-bottom {
                border-top: 1px solid #34495e;
                padding-top: 1.5rem;
                text-align: center;
                color: #95a5a6;
            }
            
            .footer-bottom p {
                margin-bottom: 0.5rem;
            }
            
            .footer-logo {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 1rem;
            }
            
            .footer-logo-icon {
                width: 30px;
                height: 30px;
                background: linear-gradient(45deg, #3498db, #2980b9);
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
            }
            
            .footer-logo-text {
                font-size: 1.3rem;
                font-weight: 600;
                color: #ecf0f1;
            }
            
            .footer-description {
                color: #95a5a6;
                line-height: 1.6;
                margin-bottom: 1rem;
            }
            
            /* Responsive */
            @media (max-width: 768px) {
                .footer-main {
                    grid-template-columns: 1fr;
                    gap: 1.5rem;
                }
                
                .footer-content {
                    padding: 0 1rem;
                }
                
                .social-links {
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        
        
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-main">
                    <!-- About Section -->
                    <div class="footer-section">
                        <div class="footer-logo">
                            <div class="footer-logo-icon">🚀</div>
                            <div class="footer-logo-text">MyProject</div>
                        </div>
                        <p class="footer-description">
                            BUILDING A SYSTEM TO MANAGE EMPLOYEE LEAVE REQUESTS
                        </p>
                    </div>
                    
                    <!-- Contact Info -->
                    <div class="footer-section">
                        <h3>Contact Information</h3>
                        <div class="contact-info">
                            <div class="contact-item">
                                <div class="contact-icon">📍</div>
                                <span>FPT University</span>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">📞</div>
                                <span>23456789JQK</span>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">✉️</div>
                                <span>info@myproject.edu.vn</span>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <!-- Social Media -->
                    <div class="footer-section">
                        <h3>Follow Us</h3>
                        <div class="social-links">
                            <a href="#" class="social-link">📘</a>
                            <a href="#" class="social-link">🐦</a>
                            <a href="#" class="social-link">📷</a>
                            <a href="#" class="social-link">💼</a>
                            <a href="#" class="social-link">📺</a>
                        </div>
                    </div>
                </div>
                
                <!-- Footer Bottom -->
                <div class="footer-bottom">
                    <p>&copy; 2025 MyProject. All rights reserved.</p>
                    <p>Made with ❤️ by FPT University Students</p>
                </div>
            </div>
        </footer>
    </body>
</html>