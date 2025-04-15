<%-- 
    Document   : home
    Created on : 18 mars 2025, 23:38:17
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Accueil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <!-- Icons pour la sidebar -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>/* Statistiques - Summary */
.stats-summary {
    display: flex;
    justify-content: space-between;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.stat-item {
    flex: 1;
    text-align: center;
    background-color: #f3f7fb;
    border-radius: 10px;
    padding: 1rem;
    border-left: 4px solid #2196F3;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.dark-theme .stat-item {
    background-color: #1a2035;
    border-left: 4px solid #42A5F5;
}

.stat-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
}

.dark-theme .stat-item:hover {
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
}

.stat-value {
    font-size: 2.5rem;
    font-weight: 700;
    color: #2196F3;
    line-height: 1;
    margin-bottom: 0.5rem;
}

.dark-theme .stat-value {
    color: #42A5F5;
}

.stat-label {
    color: #546e7a;
    font-size: 0.875rem;
    font-weight: 500;
}

.dark-theme .stat-label {
    color: #b0b0b0;
}

/* Conteneur pour les graphiques */
[style="height: 250px;"] {
    position: relative;
    margin-top: 1rem;
    border-radius: 10px;
    overflow: hidden;
}

/* Styles pour les états vides */
.empty-state {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2.5rem 1rem;
    background-color: #f3f7fb;
    border-radius: 10px;
    text-align: center;
}

.dark-theme .empty-state {
    background-color: #1a2035;
}

.empty-state i {
    font-size: 3rem;
    color: #b0bec5;
    margin-bottom: 1rem;
}

.dark-theme .empty-state i {
    color: #455a64;
}

.empty-state p {
    color: #546e7a;
    font-size: 1rem;
}

.dark-theme .empty-state p {
    color: #b0b0b0;
}

/* Styles pour les listes de risques et d'actions */
.risks-list,
.actions-list {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
    max-height: 300px;
    overflow-y: auto;
}

.risk-item,
.action-item {
    background-color: #f3f7fb;
    border-radius: 10px;
    padding: 1rem;
    border-left: 4px solid #2196F3;
}

.dark-theme .risk-item,
.dark-theme .action-item {
    background-color: #1a2035;
    border-left: 4px solid #42A5F5;
}

.risk-header,
.action-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.75rem;
}

.risk-title,
.action-title {
    font-weight: 600;
    color: #263238;
}

.dark-theme .risk-title,
.dark-theme .action-title {
    color: #e0e0e0;
}

.risk-priority,
.action-status {
    font-size: 0.75rem;
    padding: 0.25rem 0.5rem;
    border-radius: 6px;
    font-weight: 500;
}

/* Couleurs des statuts */
.risk-priority.high,
.action-status.urgent {
    background-color: rgba(220, 53, 69, 0.1);
    color: #dc3545;
}

.risk-priority.medium,
.action-status.in-progress {
    background-color: rgba(255, 193, 7, 0.1);
    color: #ffc107;
}

.risk-priority.low,
.action-status.completed {
    background-color: rgba(40, 167, 69, 0.1);
    color: #28a745;
}

.dark-theme .risk-priority.high,
.dark-theme .action-status.urgent {
    background-color: rgba(220, 53, 69, 0.2);
}

.dark-theme .risk-priority.medium,
.dark-theme .action-status.in-progress {
    background-color: rgba(255, 193, 7, 0.2);
}

.dark-theme .risk-priority.low,
.dark-theme .action-status.completed {
    background-color: rgba(40, 167, 69, 0.2);
}

.risk-details,
.action-details {
    display: flex;
    font-size: 0.875rem;
    color: #546e7a;
    margin-bottom: 0.75rem;
    gap: 1rem;
}

.dark-theme .risk-details,
.dark-theme .action-details {
    color: #b0b0b0;
}

.risk-project,
.action-project,
.risk-date,
.action-date {
    display: flex;
    align-items: center;
    gap: 0.375rem;
}

.risk-description,
.action-description {
    font-size: 0.875rem;
    color: #546e7a;
    line-height: 1.5;
}

.dark-theme .risk-description,
.dark-theme .action-description {
    color: #b0b0b0;
}

/* Personnalisation de la scrollbar */
.risks-list::-webkit-scrollbar,
.actions-list::-webkit-scrollbar {
    width: 4px;
}

.risks-list::-webkit-scrollbar-track,
.actions-list::-webkit-scrollbar-track {
    background: #f1f5f9;
}

.dark-theme .risks-list::-webkit-scrollbar-track,
.dark-theme .actions-list::-webkit-scrollbar-track {
    background: #283646;
}

.risks-list::-webkit-scrollbar-thumb,
.actions-list::-webkit-scrollbar-thumb {
    background: #b0bec5;
    border-radius: 10px;
}

.dark-theme .risks-list::-webkit-scrollbar-thumb,
.dark-theme .actions-list::-webkit-scrollbar-thumb {
    background: #455a64;
}

/* Toast notifications */
.toast-container {
    position: fixed;
    bottom: 2rem;
    right: 2rem;
    z-index: 9999;
}

.toast {
    display: flex;
    align-items: center;
    gap: 1rem;
    background: white;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    padding: 1rem;
    width: 320px;
    max-width: 100%;
    transform: translateY(30px);
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
}

.dark-theme .toast {
    background: #1a2035;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.toast.show {
    transform: translateY(0);
    opacity: 1;
    visibility: visible;
}

.toast-icon {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: rgba(40, 167, 69, 0.1);
    color: #28a745;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
}

.dark-theme .toast-icon {
    background: rgba(40, 167, 69, 0.2);
}

.toast-content {
    flex: 1;
}

.toast-title {
    font-weight: 600;
    color: #263238;
    margin-bottom: 0.25rem;
}

.dark-theme .toast-title {
    color: #e0e0e0;
}

.toast-message {
    font-size: 0.875rem;
    color: #546e7a;
}

.dark-theme .toast-message {
    color: #b0b0b0;
}

.toast-close {
    background: transparent;
    border: none;
    color: #b0bec5;
    font-size: 1rem;
    cursor: pointer;
    padding: 0.25rem;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    transition: background-color 0.2s ease;
}

.toast-close:hover {
    background-color: #f1f5f9;
    color: #546e7a;
}

.dark-theme .toast-close:hover {
    background-color: #283646;
    color: #e0e0e0;
}

/* Responsive design for dashboard */
@media (max-width: 992px) {
    .stats-summary {
        flex-wrap: wrap;
    }

    .stat-item {
        flex-basis: calc(50% - 0.5rem);
        margin-bottom: 1rem;
    }
}

@media (max-width: 768px) {
    .form-container {
        display: block;
    }

    .form-section {
        margin-bottom: 1.5rem;
    }

    .stats-summary {
        flex-direction: column;
    }

    .stat-item {
        flex-basis: 100%;
    }

    .toast-container {
        left: 50%;
        transform: translateX(-50%);
        right: auto;
        width: 90%;
    }

    .toast {
        width: 100%;
    }
}</style>
</head>
<body>
    <!-- Header principal -->
    <header class="main-header">
        <div class="logo">
            <span class="eadn">EADN</span> <span class="timex">Timex</span>
        </div>
        <div class="header-search">
            <input type="text" placeholder="Rechercher...">
            <button><i class="fas fa-search"></i></button>
        </div>
        <div class="user-menu">
            <span class="user-name">${sessionScope.utilisateur.nom}</span>
            <div class="user-avatar" id="avatar-trigger">
                <span>${sessionScope.utilisateur.initiales}</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            <div class="user-dropdown" id="user-dropdown">
                <div class="dropdown-header">
                    <div class="user-avatar-lg">${sessionScope.utilisateur.initiales}</div>
                    <div class="user-info">
                        <div class="user-fullname">${sessionScope.utilisateur.nom} ${sessionScope.utilisateur.prenom}</div>
                        <div class="user-email">${sessionScope.utilisateur.email}</div>
                    </div>
                </div>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/views/coordonne.jsp"><i class="fas fa-user"></i> Mes coordonnées</a></li>
                   
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/views/login.jsp" class="login">
                            <i class="fas fa-sign-out-alt"></i> Déconnexion
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <!-- Layout principal avec sidebar et contenu -->
    <div class="main-layout">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
           
            <nav class="sidebar-nav">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/views/home.jsp" class="nav-item has-submenu active">
                            <i class="fas fa-home"></i>
                            <span>Accueil</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#" class="nav-item has-submenu " id="project-menu">
                            <i class="fas fa-project-diagram"></i>
                            <span>Projets</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu " id="project-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/projet.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter projet
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeProjet.jsp" >
                                    <i class="fas fa-list"></i> Liste des projets
                                </a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-item has-submenu " id="opportunite-menu">
                            <i class="fas fa-lightbulb"></i>
                            <span>Opportunités</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu " id="opportunite-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/opportunite.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter opportunité
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeOpportunite.jsp" >
                                    <i class="fas fa-list"></i> Liste des opportunités
                                </a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-item has-submenu" id="team-menu">
                            <i class="fas fa-users"></i>
                            <span>Ressource</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="team-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/ressources.jsp">
                                    <i class="fas fa-user-plus"></i> Nouvel employé
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeRessources.jsp">
                                    <i class="fas fa-users-cog"></i> liste des employés
                                </a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/views/timesheet.jsp" class="nav-item">
                            <i class="fas fa-cog"></i>
                            <span>Timesheet</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="sidebar-footer">
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="fas fa-chevron-left"></i>
                </div>
                <div class="theme-toggle" id="theme-toggle">
                    <i class="fas fa-moon"></i>
                </div>
            </div>
        </aside>

        <!-- Contenu principal -->
        
        <main class="main-content" id="main-content">
            <div class="container">
                <div class="app-header">
                    <div class="breadcrumbs">
                        <span>Accueil</span>
                    </div>
                    <div class="header-top">
                        <h1>Tableau de bord</h1>
                        <div class="header-actions">
                            <div class="date-display"></div>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <div class="form-container">
                    <div class="form-section">
                        <h4 class="section-title">
                            <i class="fas fa-users"></i>
                            Statistiques des employés
                        </h4>
                        <div class="stats-summary">
                            <div class="stat-item">
                                <div class="stat-value" id="total-employees">42</div>
                                <div class="stat-label">Total employés</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value" id="active-employees">38</div>
                                <div class="stat-label">Actifs</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value" id="new-employees">5</div>
                                <div class="stat-label">Nouveaux ce mois</div>
                            </div>
                        </div>
                        <div style="height: 250px;">
                            <canvas id="employee-chart"></canvas>
                        </div>
                    </div>
                    
                    <div class="form-section">
                        <h4 class="section-title">
                            <i class="fas fa-chart-pie"></i>
                            Statistiques des projets
                        </h4>
                        <div class="stats-summary">
                            <div class="stat-item">
                                <div class="stat-value" id="total-projects">24</div>
                                <div class="stat-label">Total projets</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value" id="active-projects">15</div>
                                <div class="stat-label">En cours</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value" id="completed-projects">9</div>
                                <div class="stat-label">Terminés</div>
                            </div>
                        </div>
                        <div style="height: 250px;">
                            <canvas id="project-chart"></canvas>
                        </div>
                    </div>
                </div>

                <div class="form-container">
                    <div class="form-section">
                        <h4 class="section-title">
                            <i class="fas fa-exclamation-triangle"></i>
                            Risques assignés
                        </h4>
                        <c:choose>
                            <c:when test="${empty risks}">
                                <div class="empty-state">
                                    <i class="fas fa-file-alt"></i>
                                    <p>Aucun risque n'est actuellement assigné</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="risks-list">
                                    <c:forEach items="${risks}" var="risk">
                                        <div class="risk-item">
                                            <div class="risk-header">
                                                <div class="risk-title">${risk.titre}</div>
                                                <div class="risk-priority ${risk.priorite}">
                                                    ${risk.priorite}
                                                </div>
                                            </div>
                                            <div class="risk-details">
                                                <div class="risk-project">
                                                    <i class="fas fa-project-diagram"></i> ${risk.projet}
                                                </div>
                                                <div class="risk-date">
                                                    <i class="fas fa-clock"></i> ${risk.dateEcheance}
                                                </div>
                                            </div>
                                            <div class="risk-description">${risk.description}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <div class="form-section">
                        <h4 class="section-title">
                            <i class="fas fa-tasks"></i>
                            Éléments d'action assignés
                        </h4>
                        <c:choose>
                            <c:when test="${empty actions}">
                                <div class="empty-state">
                                    <i class="fas fa-clipboard-list"></i>
                                    <p>Aucune action n'est actuellement assignée</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="actions-list">
                                    <c:forEach items="${actions}" var="action">
                                        <div class="action-item">
                                            <div class="action-header">
                                                <div class="action-title">${action.titre}</div>
                                                <div class="action-status ${action.statut}">
                                                    ${action.statut}
                                                </div>
                                            </div>
                                            <div class="action-details">
                                                <div class="action-project">
                                                    <i class="fas fa-project-diagram"></i> ${action.projet}
                                                </div>
                                                <div class="action-date">
                                                    <i class="fas fa-clock"></i> ${action.dateEcheance}
                                                </div>
                                            </div>
                                            <div class="action-description">${action.description}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Notification toast -->
    <div class="toast-container">
        <div class="toast" id="toast-success">
            <div class="toast-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="toast-content">
                <div class="toast-title">Succès!</div>
                <div class="toast-message">Les données ont été chargées avec succès.</div>
            </div>
            <button class="toast-close">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

    <script>document.addEventListener('DOMContentLoaded', function() {
    // === Initialisation de la date courante ===
    initializeCurrentDate();
    
    // === Initialisation des graphiques ===
    initializeCharts();
    
    // === Initialisation des interactions UI ===
    initializeUIInteractions();
    
    // === Récupération des données (simulation) ===
    fetchDashboardData();
});

/**
 * Initialise l'affichage de la date courante
 */
function initializeCurrentDate() {
    const currentDateElement = document.getElementById('current-date');
    if (currentDateElement) {
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const currentDate = new Date().toLocaleDateString('fr-FR', options);
        currentDateElement.textContent = currentDate;
    }
}

/**
 * Initialise les graphiques du tableau de bord
 */
function initializeCharts() {
    // Graphique de croissance des employés
    initializeEmployeeChart();
    
    // Graphique de répartition des projets
    initializeProjectChart();
}

/**
 * Initialise le graphique de croissance des employés
 */
function initializeEmployeeChart() {
    const employeeChartElement = document.getElementById('employee-chart');
    if (!employeeChartElement) return;
    
    const ctx = employeeChartElement.getContext('2d');
    
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août'],
            datasets: [{
                label: 'Nombre d\'employés',
                data: [28, 30, 32, 35, 37, 39, 40, 42],
                borderColor: '#2196F3',
                backgroundColor: 'rgba(33, 150, 243, 0.1)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        title: function(tooltipItems) {
                            return tooltipItems[0].label + ' 2025';
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        precision: 0
                    }
                }
            }
        }
    });
}

/**
 * Initialise le graphique de répartition des projets
 */
function initializeProjectChart() {
    const projectChartElement = document.getElementById('project-chart');
    if (!projectChartElement) return;
    
    const ctx = projectChartElement.getContext('2d');
    
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['En cours', 'Terminés', 'En pause', 'Planifiés'],
            datasets: [{
                data: [15, 9, 3, 6],
                backgroundColor: [
                    '#2196F3',  // En cours
                    '#28a745',  // Terminés
                    '#ffc107',  // En pause
                    '#6c757d'   // Planifiés
                ],
                borderWidth: 0
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutout: '70%',
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        boxWidth: 12,
                        padding: 15
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const label = context.label || '';
                            const value = context.raw || 0;
                            const total = context.dataset.data.reduce((acc, val) => acc + val, 0);
                            const percentage = Math.round((value / total) * 100);
                            return `${label}: ${value} (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });
}

/**
 * Initialise les interactions de l'interface utilisateur
 */
function initializeUIInteractions() {
    // Gestion du toast de notification
    initializeToastNotification();
    
    // Gestion du menu utilisateur
    initializeUserMenu();
    
    // Gestion du thème sombre/clair
    initializeThemeToggle();
    
    // Gestion de la sidebar
    initializeSidebar();
}

/**
 * Initialise les notifications toast
 */
function initializeToastNotification() {
    const toastCloseBtn = document.querySelector('.toast-close');
    const toastElement = document.getElementById('toast-success');
    
    if (toastCloseBtn && toastElement) {
        toastCloseBtn.addEventListener('click', function() {
            toastElement.classList.remove('show');
        });
    }
    
    // Afficher une notification au chargement (simulation)
    setTimeout(() => {
        if (toastElement) {
            toastElement.classList.add('show');
            
            // Auto-hide après 5 secondes
            setTimeout(() => {
                toastElement.classList.remove('show');
            }, 5000);
        }
    }, 1000);
}

/**
 * Initialise le menu utilisateur dropdown
 */
function initializeUserMenu() {
    const avatarTrigger = document.getElementById('avatar-trigger');
    const userDropdown = document.getElementById('user-dropdown');
    
    if (avatarTrigger && userDropdown) {
        avatarTrigger.addEventListener('click', function(e) {
            e.stopPropagation();
            userDropdown.classList.toggle('show');
        });
        
        document.addEventListener('click', function(e) {
            if (!userDropdown.contains(e.target) && !avatarTrigger.contains(e.target)) {
                userDropdown.classList.remove('show');
            }
        });
    }
}

/**
 * Initialise le toggle du thème
 */
function initializeThemeToggle() {
    const themeToggle = document.getElementById('theme-toggle');
    
    if (themeToggle) {
        // Charger le thème sauvegardé
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'dark') {
            document.body.classList.add('dark-theme');
            themeToggle.querySelector('i').classList.replace('fa-moon', 'fa-sun');
        }
        
        // Ajouter l'écouteur d'événement pour le toggle
        themeToggle.addEventListener('click', function() {
            document.body.classList.toggle('dark-theme');
            const isDark = document.body.classList.contains('dark-theme');
            
            // Mettre à jour l'icône
            const icon = themeToggle.querySelector('i');
            if (isDark) {
                icon.classList.remove('fa-moon');
                icon.classList.add('fa-sun');
            } else {
                icon.classList.remove('fa-sun');
                icon.classList.add('fa-moon');
            }
            
            // Sauvegarder la préférence
            localStorage.setItem('theme', isDark ? 'dark' : 'light');
        });
    }
}

/**
 * Initialise la sidebar et ses interactions
 */
function initializeSidebar() {
    // Toggle des sous-menus
    const menuItems = document.querySelectorAll('.nav-item.has-submenu');
    menuItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Récupérer l'ID du sous-menu
            const submenuId = this.id.replace('menu', 'submenu');
            const submenu = document.getElementById(submenuId);
            
            // Toggle la classe active sur l'élément de menu
            this.classList.toggle('active');
            
            // Toggle la classe show sur le sous-menu
            if (submenu) {
                submenu.classList.toggle('show');
            }
        });
    });
    
    // S'assurer que les sous-menus avec des éléments actifs sont étendus
    const activeSubmenuItems = document.querySelectorAll('.submenu a.active');
    activeSubmenuItems.forEach(item => {
        const parentSubmenu = item.closest('.submenu');
        if (parentSubmenu) {
            parentSubmenu.classList.add('show');
            
            // Trouver et activer l'élément de menu parent
            const menuId = parentSubmenu.id.replace('submenu', 'menu');
            const menuItem = document.getElementById(menuId);
            if (menuItem) {
                menuItem.classList.add('active');
            }
        }
    });
    
    // Toggle de la sidebar mobile
    const sidebarToggle = document.createElement('button');
    sidebarToggle.classList.add('sidebar-toggle');
    sidebarToggle.innerHTML = '<i class="fas fa-bars"></i>';
    document.querySelector('.main-header').prepend(sidebarToggle);
    
    sidebarToggle.addEventListener('click', function() {
        document.body.classList.toggle('sidebar-open');
    });
    
    // Toggle de la sidebar (réduction)
    const sidebarCollapseBtn = document.getElementById('sidebar-collapse');
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');
    
    if (sidebarCollapseBtn && sidebar && mainContent) {
        sidebarCollapseBtn.addEventListener('click', function() {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
            
            // Changer la direction de l'icône
            const icon = this.querySelector('i');
            if (sidebar.classList.contains('collapsed')) {
                icon.classList.remove('fa-chevron-left');
                icon.classList.add('fa-chevron-right');
            } else {
                icon.classList.remove('fa-chevron-right');
                icon.classList.add('fa-chevron-left');
            }
            
            // Redimensionner les graphiques après l'animation
            setTimeout(() => {
                window.dispatchEvent(new Event('resize'));
            }, 300);
        });
    }
}

/**
 * Simule la récupération des données pour le tableau de bord
 */
function fetchDashboardData() {
    // Simulation de retard réseau
    setTimeout(() => {
        // Ici on pourrait appeler une API pour récupérer les données
        // Pour l'instant, nous avons des données statiques
        
        updateEmployeeStats({
            total: 42,
            active: 38,
            new: 5
        });
        
        updateProjectStats({
            total: 24,
            active: 15,
            completed: 9
        });
        
    }, 500);
}

/**
 * Met à jour les statistiques des employés
 */
function updateEmployeeStats(data) {
    document.getElementById('total-employees').textContent = data.total;
    document.getElementById('active-employees').textContent = data.active;
    document.getElementById('new-employees').textContent = data.new;
}

/**
 * Met à jour les statistiques des projets
 */
function updateProjectStats(data) {
    document.getElementById('total-projects').textContent = data.total;
    document.getElementById('active-projects').textContent = data.active;
    document.getElementById('completed-projects').textContent = data.completed;
}</script>
</body>
</html>