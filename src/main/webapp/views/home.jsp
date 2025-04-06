<%-- 
    Document   : home
    Created on : 18 mars 2025, 23:38:17
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>EADN Dashboard</title>
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%@ include file="/includes/sidebar.jsp" %>

    <main class="main container" id="main">
        <div class="dashboard-grid">
            <!-- Employee Growth Chart -->
            <div class="dashboard-card">
                <h2 class="card-title">
                    <i class="ri-team-line"></i>
                    Employés de l'entreprise
                </h2>
                
            </div>
            
            <!-- Project Statistics -->
            <div class="dashboard-card">
                <h2 class="card-title">
                    <i class="ri-pie-chart-line"></i>
                    Statistiques
                </h2>
               
            </div>
            
            <!-- Assigned Risks -->
            <div class="dashboard-card">
                <h2 class="card-title">
                    <i class="ri-alert-line"></i>
                    Risques assignés
                </h2>
                <c:choose>
                    <c:when test="${empty risks}">
                        <div class="empty-state">
                            <i class="ri-file-warning-line"></i>
                            <p>Aucun risque n'est défini.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="risks-list">
                            <c:forEach items="${risks}" var="risk">
                                <!-- Risk items will be displayed here -->
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Assigned Actions -->
            <div class="dashboard-card">
                <h2 class="card-title">
                    <i class="ri-task-line"></i>
                    Éléments d'action assignés
                </h2>
                <c:choose>
                    <c:when test="${empty actions}">
                        <div class="empty-state">
                            <i class="ri-calendar-todo-line"></i>
                            <p>Aucune action n'est assignée.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="actions-list">
                            <c:forEach items="${actions}" var="action">
                                <!-- Action items will be displayed here -->
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
    <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
</body>
</html>