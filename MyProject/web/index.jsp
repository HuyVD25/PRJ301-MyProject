<%-- 
    Document   : index
    Created on : Jul 17, 2025, 4:30:32 PM
    Author     : MSI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <style>
            html {
                height: 100%;
            }
            * {
                padding: 0; 
                margin: 0;
                box-sizing: border-box;
            }
            
            body.main {
                font-family: Arial, sans-serif;
                min-height: 100vh;
                display: grid;
                grid-template-areas: 
                    "header header"
                    "nav content"
                    "footer footer";
                grid-template-columns: 250px 1fr;
                grid-template-rows: 60px 1fr 50px;
                gap: 0;
            }
            
            .headercontainer {
                grid-area: header;
                background-color: #f8f9fa;
                border-bottom: 1px solid #dee2e6;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                z-index: 1000;
                position: relative;
            }
            
            .footercontainer {
                grid-area: footer;
                background-color: #343a40;
                color: white;
                box-shadow: 0 -2px 4px rgba(0,0,0,0.1);
                z-index: 1000;
                position: relative;
            }
            
            .navcontainer {
                grid-area: nav;
                background-color: #e9ecef;
                border-right: 1px solid #dee2e6;
                overflow-y: auto;
                overflow-x: hidden;
                z-index: 999;
                position: relative;
            }
            
            .contentcontainer {
                grid-area: content;
                padding: 20px;
                background-color: #ffffff;
                overflow-y: auto;
                overflow-x: hidden;
            }
            
            
        </style>
    </head>
    <body class="main">
        <div class="headercontainer">
            <%@ include file="View/Header.jsp"%>
        </div>
        
        <div class="navcontainer">
            <%@ include file="View/Nav.jsp"%>
        </div>
        
        <div class="contentcontainer">
            <%@ include file="View/Content.jsp"%>
        </div>
        
        <div class="footercontainer">
            <%@ include file="View/Footer.jsp"%>
        </div>
    </body>
</html>