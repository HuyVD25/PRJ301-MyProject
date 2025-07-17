/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.User;
import DAO.userController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * LoginServlet - Xử lý đăng nhập người dùng
 * @author MSI
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class loginServlet extends HttpServlet {

    private userController userController;
    
    /**
     * Khởi tạo servlet
     */
    @Override
    public void init() throws ServletException {
        userController = new userController();
        
        // Test database connection khi khởi động
        if (userController.testConnection()) {
            System.out.println("✅ LoginServlet initialized - Database connection successful");
        } else {
            System.err.println("❌ LoginServlet initialization failed - Database connection error");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * Chuyển hướng đến trang login
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Kiểm tra xem user đã đăng nhập chưa
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // Nếu đã đăng nhập, chuyển hướng đến dashboard
            User user = (User) session.getAttribute("user");
            String redirectURL = getDashboardURL(user.getRole());
            response.sendRedirect(redirectURL);
            return;
        }
        
        // Nếu chưa đăng nhập, chuyển đến trang login
        request.getRequestDispatcher("/MyProject/view/Login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * Xử lý form đăng nhập
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set encoding để xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy thông tin từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Log thông tin đăng nhập (không log password trong production)
        System.out.println("Login attempt for username: " + username);
        
        try {
            // Validate input
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                
                handleLoginError(request, response, "Vui lòng nhập đầy đủ thông tin đăng nhập!");
                return;
            }
            
            // Trim whitespace
            username = username.trim();
            password = password.trim();
            
        
            
            // Authenticate user
            // Note: Trong thực tế, nên hash password trước khi so sánh
            // String hashedPassword = hashPassword(password);
            User user = userController.authenticateUser(username, password);
            
            if (user != null) {
                // Đăng nhập thành công
                handleLoginSuccess(request, response, user);
                
            } else {
                // Đăng nhập thất bại
                handleLoginError(request, response, "Tên đăng nhập hoặc mật khẩu không đúng!");
            }
            
        } catch (Exception e) {
            // Log lỗi hệ thống
            System.err.println("Login system error for user: " + username);
            e.printStackTrace();
            
            handleLoginError(request, response, "Lỗi hệ thống. Vui lòng thử lại sau!");
        }
    }
    
    /**
     * Xử lý đăng nhập thành công
     */
    private void handleLoginSuccess(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        // Tạo session
        HttpSession session = request.getSession(true);
        
        // Lưu thông tin user vào session
        session.setAttribute("user", user);
        session.setAttribute("userId", user.getId());
        session.setAttribute("username", user.getUsername());
        session.setAttribute("role", user.getRole());
        session.setAttribute("loginTime", System.currentTimeMillis());
        
        // Set session timeout (30 phút)
        session.setMaxInactiveInterval(30 * 60);
        
        // Log successful login
        System.out.println("✅ Login successful for user: " + user.getUsername() + " (Role: " + user.getRole() + ")");
        
        // Chuyển hướng dựa trên role
        String redirectURL = getDashboardURL(user.getRole());
        
        // Kiểm tra nếu có returnURL trong session (redirect sau login)
        String returnURL = (String) session.getAttribute("returnURL");
        if (returnURL != null && !returnURL.isEmpty()) {
            session.removeAttribute("returnURL");
            response.sendRedirect(returnURL);
        } else {
            response.sendRedirect(redirectURL);
        }
    }
    
    /**
     * Xử lý đăng nhập thất bại
     */
    private void handleLoginError(HttpServletRequest request, HttpServletResponse response, String errorMessage) 
            throws ServletException, IOException {
        
        // Set error message
        request.setAttribute("error", errorMessage);
        request.setAttribute("errorType", "login_failed");
        
        // Log failed login
        String username = request.getParameter("username");
        System.out.println("❌ Login failed for username: " + username + " - " + errorMessage);
        
        // Forward về trang login với error message
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    /**
     * Xác định URL dashboard dựa trên role
     */
    private String getDashboardURL(String role) {
        if (role == null) {
            return "employee/dashboard.jsp";
        }
        
        switch (role.toUpperCase()) {
            case "ADMIN":
                return "admin/dashboard.jsp";
            case "MANAGER":
                return "manager/dashboard.jsp";
            case "DEPARTMENT":
                return "department/dashboard.jsp";
            case "EMPLOYEE":
            default:
                return "employee/dashboard.jsp";
        }
    }
    
    /**
     * Hash password (sử dụng trong production)
     * Ví dụ với SHA-256 hoặc BCrypt
     */
    private String hashPassword(String password) {
        // Implement password hashing here
        // Ví dụ với BCrypt:
        // return BCrypt.hashpw(password, BCrypt.gensalt());
        
        // Tạm thời return password gốc (không an toàn)
        return password;
    }
    
    /**
     * Verify hashed password
     */
    private boolean verifyPassword(String password, String hashedPassword) {
        // Implement password verification here
        // Ví dụ với BCrypt:
        // return BCrypt.checkpw(password, hashedPassword);
        
        // Tạm thời so sánh trực tiếp (không an toàn)
        return password.equals(hashedPassword);
    }

    /**
     * Returns a short description of the servlet.
     */
    @Override
    public String getServletInfo() {
        return "LoginServlet - Handles user authentication for Leave Management System";
    }
    
    /**
     * Cleanup resources
     */
    @Override
    public void destroy() {
        System.out.println("LoginServlet destroyed");
        super.destroy();
    }
}