<%-- 
    Document   : Header
    Created on : Jul 17, 2025, 4:26:50 PM
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
            }
            
            .header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                padding: 1rem 2rem;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                z-index: 1000;
            }
            
            .header-content {
                max-width: 1200px;
                margin: 0 auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            
            .logo {
                color: white;
                font-size: 1.8rem;
                font-weight: 700;
                letter-spacing: -0.5px;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }
            
            .logo-icon {
                width: 40px;
                height: 40px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                backdrop-filter: blur(10px);
            }
            
            .nav-menu {
                display: flex;
                gap: 2rem;
                list-style: none;
            }
            
            .nav-item {
                color: rgba(255, 255, 255, 0.9);
                text-decoration: none;
                font-weight: 500;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
                position: relative;
            }
            
            .nav-item:hover {
                background: rgba(255, 255, 255, 0.1);
                color: white;
                transform: translateY(-2px);
            }
            
            .nav-item::after {
                content: '';
                position: absolute;
                bottom: -5px;
                left: 50%;
                width: 0;
                height: 2px;
                background: white;
                transition: all 0.3s ease;
                transform: translateX(-50%);
            }
            
            .nav-item:hover::after {
                width: 80%;
            }
            
            .user-actions {
                display: flex;
                align-items: center;
                gap: 1rem;
            }
            
            .user-avatar {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            
            .user-avatar:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: scale(1.1);
            }
            
            /* Mobile responsive */
            @media (max-width: 768px) {
                .header {
                    padding: 1rem;
                }
                
                .nav-menu {
                    display: none;
                }
                
                .logo {
                    font-size: 1.5rem;
                }
                
                .logo-icon {
                    width: 35px;
                    height: 35px;
                }
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="header-content">
                <div class="logo">
                    <div class="logo-icon">🚀</div>
                    MyProject
                </div>
                <div class="user-actions">
                    <div class="user-avatar">Huy</div>
                </div>
            </div>
        </header>
    </body>
</html>