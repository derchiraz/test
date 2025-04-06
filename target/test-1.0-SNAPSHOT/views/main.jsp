<%-- 
    Document   : layout
    Created on : 18 mars 2025, 22:37:38
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <title>EADN Dashboard</title>
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%@ include file="/includes/sidebar.jsp" %>

    <main class="main container" id="main">
        <!-- Your page content goes here -->
        <h1>Sidebar Menu</h1>
    </main>

    <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
</body>
</html>