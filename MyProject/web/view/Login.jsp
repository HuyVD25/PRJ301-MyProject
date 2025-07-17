<%-- 
    Document   : Login
    Created on : Jul 17, 2025, 5:57:39 PM
    Author     : MSI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - Hệ thống quản lý nghỉ phép</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }
            
            .login-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border-radius: 20px;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                padding: 3rem;
                width: 100%;
                max-width: 450px;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            
            .login-header {
                text-align: center;
                margin-bottom: 2.5rem;
            }
            
            .logo {
                width: 80px;
                height: 80px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem;
                font-size: 2rem;
                color: white;
                box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
            }
            
            .login-title {
                color: #2c3e50;
                font-size: 1.8rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
            }
            
            .login-subtitle {
                color: #7f8c8d;
                font-size: 1rem;
                font-weight: 400;
            }
            
            .form-group {
                margin-bottom: 1.5rem;
                position: relative;
            }
            
            .form-label {
                display: block;
                color: #34495e;
                font-weight: 600;
                margin-bottom: 0.5rem;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            
            .form-input {
                width: 100%;
                padding: 1rem 1.25rem;
                border: 2px solid #e9ecef;
                border-radius: 12px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background: rgba(255, 255, 255, 0.8);
                color: #2c3e50;
            }
            
            .form-input:focus {
                outline: none;
                border-color: #667eea;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                background: rgba(255, 255, 255, 1);
                transform: translateY(-2px);
            }
            
            .form-input::placeholder {
                color: #95a5a6;
                font-weight: 400;
            }
            
            .password-toggle {
                position: absolute;
                right: 1rem;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                color: #7f8c8d;
                cursor: pointer;
                font-size: 1.1rem;
                padding: 0.25rem;
                border-radius: 4px;
                transition: color 0.3s ease;
            }
            
            .password-toggle:hover {
                color: #667eea;
            }
            
            .form-options {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
                font-size: 0.9rem;
            }
            
            .remember-me {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #34495e;
            }
            
            .remember-me input {
                width: 18px;
                height: 18px;
                accent-color: #667eea;
            }
            
            .forgot-password {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s ease;
            }
            
            .forgot-password:hover {
                color: #5a6fd8;
                text-decoration: underline;
            }
            
            .login-button {
                width: 100%;
                padding: 1rem;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 1.5rem;
            }
            
            .login-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 15px 35px rgba(102, 126, 234, 0.3);
            }
            
            .login-button:active {
                transform: translateY(0);
            }
            
            .divider {
                text-align: center;
                margin: 1.5rem 0;
                position: relative;
                color: #bdc3c7;
                font-size: 0.9rem;
            }
            
            .divider::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1px;
                background: #e9ecef;
                z-index: 1;
            }
            
            .divider span {
                background: rgba(255, 255, 255, 0.95);
                padding: 0 1rem;
                position: relative;
                z-index: 2;
            }
            
            .social-login {
                display: flex;
                gap: 1rem;
                margin-bottom: 1.5rem;
            }
            
            .social-button {
                flex: 1;
                padding: 0.75rem;
                border: 2px solid #e9ecef;
                border-radius: 12px;
                background: rgba(255, 255, 255, 0.8);
                color: #34495e;
                text-decoration: none;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                font-weight: 600;
                transition: all 0.3s ease;
            }
            
            .social-button:hover {
                border-color: #667eea;
                background: rgba(255, 255, 255, 1);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .register-link {
                text-align: center;
                color: #7f8c8d;
                font-size: 0.9rem;
            }
            
            .register-link a {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
                margin-left: 0.25rem;
            }
            
            .register-link a:hover {
                text-decoration: underline;
            }
            
            .error-message {
                background: #e74c3c;
                color: white;
                padding: 0.75rem 1rem;
                border-radius: 8px;
                margin-bottom: 1rem;
                font-size: 0.9rem;
                display: none;
            }
            
            .success-message {
                background: #27ae60;
                color: white;
                padding: 0.75rem 1rem;
                border-radius: 8px;
                margin-bottom: 1rem;
                font-size: 0.9rem;
                display: none;
            }
            
            /* Responsive */
            @media (max-width: 480px) {
                .login-container {
                    padding: 2rem 1.5rem;
                    margin: 10px;
                }
                
                .login-title {
                    font-size: 1.5rem;
                }
                
                .social-login {
                    flex-direction: column;
                }
            }
            
            /* Animation */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            .login-container {
                animation: fadeInUp 0.6s ease-out;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <!-- Header -->
            <div class="login-header">
                <div class="logo">📋</div>
                <h1 class="login-title">Đăng nhập</h1>
                <p class="login-subtitle">Hệ thống quản lý đơn nghỉ phép</p>
            </div>
            
            <!-- Error/Success Messages -->
            <div class="error-message" id="errorMessage">
                Thông tin đăng nhập không chính xác!
            </div>
            <div class="success-message" id="successMessage">
                Đăng nhập thành công!
            </div>
            
            <!-- Login Form -->
            <form action="LoginServlet" method="POST" id="loginForm">
                <div class="form-group">
                    <label class="form-label" for="username">Tên đăng nhập</label>
                    <input 
                        type="text" 
                        id="username" 
                        name="username" 
                        class="form-input" 
                        placeholder="Nhập tên đăng nhập"
                        required
                    >
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="password">Mật khẩu</label>
                    <div style="position: relative;">
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            class="form-input" 
                            placeholder="Nhập mật khẩu"
                            required
                        >
                        <button type="button" class="password-toggle" onclick="togglePassword()">
                            👁️
                        </button>
                    </div>
                </div>
                
                
                <button type="submit" class="login-button">
                    Đăng nhập
                </button>
            </form>
           
        <script>
            function togglePassword() {
                const passwordInput = document.getElementById('password');
                const toggleButton = document.querySelector('.password-toggle');
                
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    toggleButton.textContent = '🙈';
                } else {
                    passwordInput.type = 'password';
                    toggleButton.textContent = '👁️';
                }
            }
            
            // Form validation
            document.getElementById('loginForm').addEventListener('submit', function(e) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();
                
                if (!username || !password) {
                    e.preventDefault();
                    showError('Vui lòng nhập đầy đủ thông tin!');
                    return;
                }
                
                if (password.length < 6) {
                    e.preventDefault();
                    showError('Mật khẩu phải có ít nhất 6 ký tự!');
                    return;
                }
            });
            
            function showError(message) {
                const errorDiv = document.getElementById('errorMessage');
                errorDiv.textContent = message;
                errorDiv.style.display = 'block';
                
                setTimeout(() => {
                    errorDiv.style.display = 'none';
                }, 5000);
            }
            
            function showSuccess(message) {
                const successDiv = document.getElementById('successMessage');
                successDiv.textContent = message;
                successDiv.style.display = 'block';
                
                setTimeout(() => {
                    successDiv.style.display = 'none';
                }, 3000);
            }
        </script>
    </body>
</html>