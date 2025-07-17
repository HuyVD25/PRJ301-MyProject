<%-- 
    Document   : Nav
    Created on : Jul 17, 2025, 4:30:00 PM
    Author     : MSI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation - MyProject</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            .navigation {
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                box-shadow: 2px 0 8px rgba(0, 0, 0, 0.1);
                overflow-y: auto;
                overflow-x: hidden;
            }
            
            .nav-container {
                padding: 1rem;
                height: 100%;
            }
            
            .nav-logo {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: white;
                font-size: 1.2rem;
                font-weight: 700;
                margin-bottom: 1.5rem;
                padding: 0.5rem;
                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            }
            
            .nav-logo-icon {
                width: 30px;
                height: 30px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                backdrop-filter: blur(10px);
            }
            
            .nav-section {
                margin-bottom: 1.5rem;
            }
            
            .nav-section-title {
                color: rgba(255, 255, 255, 0.8);
                font-size: 0.85rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                padding: 0.25rem 0.5rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            
            .nav-item {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                color: rgba(255, 255, 255, 0.95);
                text-decoration: none;
                font-weight: 500;
                padding: 0.75rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
                margin-bottom: 0.5rem;
                border: 1px solid rgba(255, 255, 255, 0.1);
                font-size: 0.9rem;
                position: relative;
            }
            
            .nav-item:hover {
                background: rgba(255, 255, 255, 0.15);
                transform: translateX(5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            }
            
            .nav-icon {
                font-size: 1.1rem;
                width: 20px;
                height: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 5px;
                flex-shrink: 0;
            }
            
            .nav-text {
                font-size: 0.85rem;
                line-height: 1.3;
                word-wrap: break-word;
                flex: 1;
            }
            
            .nav-employee {
                border-left: 3px solid #3498db;
            }
            
            .nav-manager {
                border-left: 3px solid #e74c3c;
            }
            
            .nav-department {
                border-left: 3px solid #f39c12;
            }
            
            .role-badge {
                position: absolute;
                top: -5px;
                right: -5px;
                background: #e74c3c;
                color: white;
                font-size: 0.6rem;
                padding: 0.15rem 0.3rem;
                border-radius: 8px;
                font-weight: 600;
                min-width: 20px;
                text-align: center;
            }
            
            .role-badge.employee {
                background: #3498db;
            }
            
            .role-badge.manager {
                background: #e74c3c;
            }
            
            .role-badge.department {
                background: #f39c12;
            }
            
            .nav-divider {
                height: 1px;
                background: rgba(255, 255, 255, 0.2);
                margin: 1rem 0;
            }
            
            /* Responsive cho mobile (khi nav chuyển thành horizontal) */
            @media (max-width: 768px) {
                .navigation {
                    background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                    overflow-x: auto;
                    overflow-y: hidden;
                }
                
                .nav-container {
                    padding: 0.5rem;
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    height: 100%;
                    min-width: max-content;
                }
                
                .nav-logo {
                    margin-bottom: 0;
                    border-bottom: none;
                    border-right: 1px solid rgba(255, 255, 255, 0.2);
                    padding-right: 1rem;
                    flex-shrink: 0;
                }
                
                .nav-logo-icon {
                    width: 25px;
                    height: 25px;
                }
                
                .nav-section {
                    margin-bottom: 0;
                    display: flex;
                    gap: 0.5rem;
                    flex-shrink: 0;
                }
                
                .nav-section-title {
                    display: none;
                }
                
                .nav-item {
                    margin-bottom: 0;
                    padding: 0.5rem;
                    min-width: 45px;
                    justify-content: center;
                    flex-direction: column;
                    gap: 0.25rem;
                }
                
                .nav-text {
                    display: none;
                }
                
                .nav-icon {
                    width: 18px;
                    height: 18px;
                    font-size: 1rem;
                }
                
                .nav-divider {
                    width: 1px;
                    height: 30px;
                    background: rgba(255, 255, 255, 0.2);
                    margin: 0;
                }
                
                .role-badge {
                    top: -3px;
                    right: -3px;
                    font-size: 0.5rem;
                    padding: 0.1rem 0.2rem;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navigation">
            <div class="nav-container">
                <!-- Logo -->
                <div class="nav-logo">
                    <div class="nav-logo-icon">📋</div>
                    <span>Quản lý nghỉ phép</span>
                </div>
                
                <!-- Employee Section -->
                <div class="nav-section">
                    <div class="nav-section-title">Nhân viên</div>
                    <a href="#" class="nav-item nav-employee">
                        <div class="nav-icon">📄</div>
                        <span class="nav-text">Xem các đơn đã tạo</span>
                        <div class="role-badge employee">NV</div>
                    </a>
                    
                    <a href="#" class="nav-item nav-employee">
                        <div class="nav-icon">➕</div>
                        <span class="nav-text">Tạo đơn xin nghỉ phép</span>
                        <div class="role-badge employee">NV</div>
                    </a>
                </div>
                
                <div class="nav-divider"></div>
                
                <!-- Manager Section -->
                <div class="nav-section">
                    <div class="nav-section-title">Quản lý</div>
                    <a href="#" class="nav-item nav-manager">
                        <div class="nav-icon">✅</div>
                        <span class="nav-text">Xác thực</span>
                        <div class="role-badge manager">QL</div>
                    </a>
                    
                    <a href="#" class="nav-item nav-manager">
                        <div class="nav-icon">🔍</div>
                        <span class="nav-text">Xét duyệt đơn xin nghỉ cấp dưới</span>
                        <div class="role-badge manager">QL</div>
                    </a>
                    
                    <a href="#" class="nav-item nav-manager">
                        <div class="nav-icon">📋</div>
                        <span class="nav-text">Xem các đơn đã tạo của mình và cấp dưới</span>
                        <div class="role-badge manager">QL</div>
                    </a>
                </div>
                
                <div class="nav-divider"></div>
                
                <!-- Department Section -->
                <div class="nav-section">
                    <div class="nav-section-title">Phòng ban</div>
                    <a href="#" class="nav-item nav-department">
                        <div class="nav-icon">📅</div>
                        <span class="nav-text">Xem agenda tình hình lao động</span>
                        <div class="role-badge department">PB</div>
                    </a>
                </div>
            </div>
        </nav>
    </body>
</html>