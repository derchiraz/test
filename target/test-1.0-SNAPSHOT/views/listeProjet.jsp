<%-- 
    Document   : listeProjet
    Created on : 8 avr. 2025, 01:01:19
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listeProjet.css">
    <!-- Icons pour la sidebar -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
        <div class="notifications">
            <div class="notification-bell">
                <i class="fas fa-bell"></i>
                <span class="notification-badge">3</span>
            </div>
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
                    <li><a href="${pageContext.request.contextPath}/profil"><i class="fas fa-user"></i> Mon profil</a></li>
                    <li><a href="${pageContext.request.contextPath}/parametres"><i class="fas fa-cog"></i> Paramètres</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout" class="logout">
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
            <div class="sidebar-header">
                <div class="logo-small">ET</div>
                <span>EADN Timex</span>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/views/home.jsp" class="nav-item">
                            <i class="fas fa-home"></i>
                            <span>Tableau de bord</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-item has-submenu" id="timesheet-menu">
                            <i class="fas fa-clock"></i>
                            <span>Feuilles de temps</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="timesheet-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/timesheet/new">
                                    <i class="fas fa-plus-circle"></i> Nouvelle feuille
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/timesheet/active">
                                    <i class="fas fa-edit"></i> Feuilles actives
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/timesheet/history">
                                    <i class="fas fa-history"></i> Historique
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-item has-submenu active" id="project-menu">
                            <i class="fas fa-project-diagram"></i>
                            <span>Projets</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu show" id="project-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/projet.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter projet
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeProjet.jsp" class="active">
                                    <i class="fas fa-list"></i> Liste des projets
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/projet/rapports">
                                    <i class="fas fa-chart-line"></i> Rapports
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-item has-submenu" id="team-menu">
                            <i class="fas fa-users"></i>
                            <span>Équipes</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="team-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/equipe/nouvel-employe">
                                    <i class="fas fa-user-plus"></i> Nouvel employé
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/equipe/gestion">
                                    <i class="fas fa-users-cog"></i> Gérer équipes
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/rapports" class="nav-item">
                            <i class="fas fa-chart-bar"></i>
                            <span>Rapports</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/parametres" class="nav-item">
                            <i class="fas fa-cog"></i>
                            <span>Paramètres</span>
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
                        <a href="${pageContext.request.contextPath}/views/home.jsp">Accueil</a> / 
                        <a href="${pageContext.request.contextPath}/views/listeProjet.jsp">Projets</a> / 
                        <span>Liste des projets</span>
                    </div>
                    <div class="header-top">
                        <h1>Liste des Projets</h1>
                        <div class="header-actions">
                            <button class="btn-action" onclick="location.href='${pageContext.request.contextPath}/views/projet.jsp'">
                                <span class="icon"><i class="fas fa-plus"></i></span> Ajouter un Projet
                            </button>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <!-- Filtres et recherche -->
                <div class="filters-container">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="searchInput" placeholder="Rechercher un projet...">
                    </div>
                    <div class="filter-options">
                        <div class="filter-group">
                            <label for="statusFilter">Status:</label>
                            <select id="statusFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <option value="progress">En cours</option>
                                <option value="completed">Terminé</option>
                                <option value="pending">En attente</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label for="responsableFilter">Responsable:</label>
                            <select id="responsableFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <c:forEach var="user" items="${responsables}">
                                    <option value="${user.id}">${user.nom} ${user.prenom}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Table des projets -->
                <div class="table-container">
                    <table class="projects-table">
                        <thead>
                            <tr>
                                <th class="sortable" data-sort="nom">Nom projet <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="nomCourt">Nom court <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="responsable">Responsable <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="status">Status <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="dateDebut">Date début <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="dateFin">Date fin <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="budget">Budget <i class="fas fa-sort"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="projectsTableBody">
                            <c:choose>
                                <c:when test="${empty projets}">
                                    <tr class="empty-table">
                                        <td colspan="8">
                                            <div class="empty-state">
                                                <i class="fas fa-folder-open"></i>
                                                <p>Aucun projet trouvé</p>
                                                <button class="btn-secondary" onclick="location.href='${pageContext.request.contextPath}/views/projet.jsp'">
                                                    Ajouter un projet
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="projet" items="${projets}">
                                        <tr class="projet-row" data-id="${projet.id}" data-status="${projet.status}" data-responsable="${projet.responsable.id}">
                                            <td class="projet-name">
                                                <a href="${pageContext.request.contextPath}/projet/details/${projet.id}">${projet.nom}</a>
                                            </td>
                                            <td>${projet.nomCourt}</td>
                                            <td>${projet.responsable.nom} ${projet.responsable.prenom}</td>
                                            <td>
                                                <span class="status-badge status-${projet.status}">
                                                    <c:choose>
                                                        <c:when test="${projet.status eq 'progress'}">En cours</c:when>
                                                        <c:when test="${projet.status eq 'completed'}">Terminé</c:when>
                                                        <c:when test="${projet.status eq 'pending'}">En attente</c:when>
                                                        <c:otherwise>${projet.status}</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>
                                            <td><fmt:formatDate value="${projet.dateDebut}" pattern="dd/MM/yyyy" /></td>
                                            <td><fmt:formatDate value="${projet.dateFin}" pattern="dd/MM/yyyy" /></td>
                                            <td class="budget"><fmt:formatNumber value="${projet.budget}" type="currency" currencySymbol="€" /></td>
                                            <td class="actions">
                                                <button class="action-btn view-btn" title="Voir" onclick="location.href='${pageContext.request.contextPath}/projet/details/${projet.id}'">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn edit-btn" title="Modifier" onclick="location.href='${pageContext.request.contextPath}/projet/edit/${projet.id}'">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="action-btn delete-btn" title="Supprimer" onclick="confirmerSuppression(${projet.id})">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination-container" id="pagination">
                    <button class="pagination-arrow" id="prevPage" disabled>
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <div class="pagination-numbers" id="paginationNumbers">
                        <!-- Dynamiquement généré par JavaScript -->
                    </div>
                    <button class="pagination-arrow" id="nextPage">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>
        </main>
    </div>

    <!-- Modal de confirmation de suppression -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Confirmer la suppression</h4>
                <button class="close-modal" onclick="fermerModal()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir supprimer ce projet ? Cette action est irréversible.</p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" action="${pageContext.request.contextPath}/projet/delete" method="post">
                    <input type="hidden" id="deleteProjectId" name="id">
                    <button type="button" class="btn-secondary" onclick="fermerModal()">Annuler</button>
                    <button type="submit" class="btn-danger">Supprimer</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Notification toast -->
    <div class="toast-container">
        <div class="toast" id="toast-success">
            <div class="toast-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="toast-content">
                <div class="toast-title">Succès!</div>
                <div class="toast-message">${successMessage}</div>
            </div>
            <button class="toast-close">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Afficher le message de succès s'il existe
            <c:if test="${not empty successMessage}">
                document.getElementById('toast-success').classList.add('show');
                setTimeout(() => {
                    document.getElementById('toast-success').classList.remove('show');
                }, 5000);
            </c:if>
            
            // Sidebar toggle
            const sidebarToggle = document.createElement('button');
            sidebarToggle.classList.add('sidebar-toggle');
            sidebarToggle.innerHTML = '<i class="fas fa-bars"></i>';
            document.querySelector('.main-header').prepend(sidebarToggle);
            
            sidebarToggle.addEventListener('click', function() {
                document.body.classList.toggle('sidebar-open');
            });

            // Sidebar collapse
            const sidebarCollapse = document.getElementById('sidebar-collapse');
            sidebarCollapse.addEventListener('click', function() {
                document.body.classList.toggle('sidebar-collapsed');
                setTimeout(() => {
                    window.dispatchEvent(new Event('resize'));
                }, 300);
            });

            // User dropdown
            const avatarTrigger = document.getElementById('avatar-trigger');
            const userDropdown = document.getElementById('user-dropdown');
            
            avatarTrigger.addEventListener('click', function(e) {
                e.stopPropagation();
                userDropdown.classList.toggle('show');
            });
            
            document.addEventListener('click', function() {
                userDropdown.classList.remove('show');
            });
            
            // Toggle submenu
            const submenus = document.querySelectorAll('.has-submenu');
            submenus.forEach(menu => {
                menu.addEventListener('click', function(e) {
                    // Fermer tous les autres sous-menus
                    submenus.forEach(otherMenu => {
                        if (otherMenu !== menu) {
                            const subId = otherMenu.id.replace('-menu', '-submenu');
                            const subMenu = document.getElementById(subId);
                            subMenu.classList.remove('show');
                            otherMenu.classList.remove('expanded');
                        }
                    });
                    
                    const subId = this.id.replace('-menu', '-submenu');
                    const subMenu = document.getElementById(subId);
                    subMenu.classList.toggle('show');
                    this.classList.toggle('expanded');
                    e.preventDefault();
                });
            });

            // Animations sur survol
            const navItems = document.querySelectorAll('.nav-item');
            navItems.forEach(item => {
                item.addEventListener('mouseenter', function() {
                    if (!this.classList.contains('has-submenu')) {
                        this.querySelector('i:first-child').classList.add('fa-beat');
                    }
                });
                
                item.addEventListener('mouseleave', function() {
                    this.querySelector('i:first-child').classList.remove('fa-beat');
                });
            });

            // Toggle du thème clair/sombre
            const themeToggle = document.getElementById('theme-toggle');
            themeToggle.addEventListener('click', function() {
                document.body.classList.toggle('dark-theme');
                if (document.body.classList.contains('dark-theme')) {
                    themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
                    // Stocker la préférence
                    localStorage.setItem('theme', 'dark');
                } else {
                    themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
                    localStorage.setItem('theme', 'light');
                }
            });
            
            // Appliquer le thème sauvegardé
            if (localStorage.getItem('theme') === 'dark') {
                document.body.classList.add('dark-theme');
                themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
            }
            
            // Toast notification
            const toast = document.getElementById('toast-success');
            const toastClose = document.querySelector('.toast-close');
            
            toastClose.addEventListener('click', function() {
                toast.classList.remove('show');
            });

            // Gestion du tableau - Tri, filtrage et pagination
            setupTableFiltering();
            setupTableSorting();
            setupPagination();
        });

        // Configuration du filtrage du tableau
        function setupTableFiltering() {
            const searchInput = document.getElementById('searchInput');
            const statusFilter = document.getElementById('statusFilter');
            const responsableFilter = document.getElementById('responsableFilter');
            
            // Fonction pour appliquer tous les filtres
            function applyFilters() {
                const searchTerm = searchInput.value.toLowerCase();
                const statusValue = statusFilter.value;
                const responsableValue = responsableFilter.value;
                
                const rows = document.querySelectorAll('#projectsTableBody tr.projet-row');
                
                rows.forEach(row => {
                    // Ne pas filtrer les lignes vides
                    if (row.classList.contains('empty-table')) return;
                    
                    const projectName = row.querySelector('.projet-name').textContent.toLowerCase();
                    const projectStatus = row.getAttribute('data-status');
                    const projectResponsable = row.getAttribute('data-responsable');
                    
                    const matchesSearch = projectName.includes(searchTerm);
                    const matchesStatus = statusValue === 'all' || projectStatus === statusValue;
                    const matchesResponsable = responsableValue === 'all' || projectResponsable === responsableValue;
                    
                    row.style.display = (matchesSearch && matchesStatus && matchesResponsable) ? '' : 'none';
                });
                
                // Réinitialiser la pagination après le filtrage
                resetPagination();
            }
            
            // Écouter les événements de saisie et de changement
            searchInput.addEventListener('input', applyFilters);
            statusFilter.addEventListener('change', applyFilters);
            responsableFilter.addEventListener('change', applyFilters);
        }

        // Configuration du tri du tableau
        function setupTableSorting() {
            const headers = document.querySelectorAll('.sortable');
            
            headers.forEach(header => {
                header.addEventListener('click', function() {
                    const column = this.getAttribute('data-sort');
                    const icon = this.querySelector('i');
                    
                    // Déterminer la direction du tri
                    let direction = 'asc';
                    if (icon.classList.contains('fa-sort-up')) {
                        direction = 'desc';
                    } else if (icon.classList.contains('fa-sort-down')) {
                        direction = 'none';
                    }
                    
                    // Réinitialiser toutes les icônes
                    document.querySelectorAll('.sortable i').forEach(i => {
                        i.className = 'fas fa-sort';
                    });
                    
                    // Mettre à jour l'icône actuelle
                    if (direction === 'asc') {
                        icon.className = 'fas fa-sort-up';
                    } else if (direction === 'desc') {
                        icon.className = 'fas fa-sort-down';
                    }
                    
                    // Trier le tableau
                    sortTable(column, direction);
                });
            });
        }

        // Fonction pour trier le tableau
        function sortTable(column, direction) {
            if (direction === 'none') return;
            
            const tbody = document.getElementById('projectsTableBody');
            const rows = Array.from(document.querySelectorAll('#projectsTableBody tr.projet-row'));
            
            // Ignorer si le tableau est vide
            if (rows.length === 0 || rows[0].classList.contains('empty-table')) return;
            
            // Trier les lignes
            rows.sort((a, b) => {
                let valueA, valueB;
                
                // Récupérer les valeurs en fonction de la colonne
                // Create column index mapping
const columnIndices = {
    'nom': 1,
    'nomCourt': 2,
    'responsable': 3,
    'status': 4,
    'dateDebut': 5,
    'dateFin': 6
};

if (column === 'nom' || column === 'nomCourt') {
    valueA = a.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim().toLowerCase();
    valueB = b.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim().toLowerCase();
} else if (column === 'responsable') {
    valueA = a.querySelector(`td:nth-child(${columnIndices.responsable})`).textContent.trim().toLowerCase();
    valueB = b.querySelector(`td:nth-child(${columnIndices.responsable})`).textContent.trim().toLowerCase();
} else if (column === 'status') {
    valueA = a.querySelector(`td:nth-child(${columnIndices.status})`).textContent.trim().toLowerCase();
    valueB = b.querySelector(`td:nth-child(${columnIndices.status})`).textContent.trim().toLowerCase();
} else if (column === 'dateDebut' || column === 'dateFin') {
    const dateA = a.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim();
    const dateB = b.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim();
                    
                    const [dayA, monthA, yearA] = dateA.split('/');
                    const [dayB, monthB, yearB] = dateB.split('/');
                    
                    valueA = new Date(yearA, monthA - 1, dayA);
                    valueB = new Date(yearB, monthB - 1, dayB);
                } else if (column === 'budget') {
                    // Extraire les nombres des valeurs de budget
                    valueA = parseFloat(a.querySelector('td:nth-child(7)').textContent.replace(/[^0-9.-]+/g, ''));
                    valueB = parseFloat(b.querySelector('td:nth-child(7)').textContent.replace(/[^0-9.-]+/g, ''));
                }
                
                // Comparer les valeurs
                if (valueA < valueB) {
                    return direction === 'asc' ? -1 : 1;
                } else if (valueA > valueB) {
                    return direction === 'asc' ? 1 : -1;
                }
                return 0;
            });
            
            // Réorganiser les lignes dans le tableau
            rows.forEach(row => tbody.appendChild(row));
            
            // Réinitialiser la pagination après le tri
            resetPagination();
        }

        // Configuration de la pagination
        function setupPagination() {
            const itemsPerPage = 10;
            let currentPage = 1;
            
            const prevPageBtn = document.getElementById('prevPage');
            const nextPageBtn = document.getElementById('nextPage');
            const paginationNumbers = document.getElementById('paginationNumbers');
            
            function updatePagination() {
                const rows = Array.from(document.querySelectorAll('#projectsTableBody tr.projet-row')).filter(row => 
                    row.style.display !== 'none' && !row.classList.contains('empty-table')
                );
                
                const totalPages = Math.ceil(rows.length / itemsPerPage);
                
                // Mettre à jour les boutons de pagination
                prevPageBtn.disabled = currentPage === 1;
                nextPageBtn.disabled = currentPage === totalPages || totalPages === 0;
                
                // Mettre à jour les numéros de page
                paginationNumbers.innerHTML = '';
                
                // Pagination simplifiée pour un grand nombre de pages
                if (totalPages > 7) {
                    // Premières pages
                    for (let i = 1; i <= 3; i++) {
                        addPageNumber(i);
                    }
                    
                    // Ellipsis si nécessaire
                    if (currentPage > 4) {
                        const ellipsis = document.createElement('span');
                        ellipsis.className = 'pagination-ellipsis';
                        ellipsis.textContent = '...';
                        paginationNumbers.appendChild(ellipsis);
                    }
                    
                    // Page actuelle et autour
                    if (currentPage > 3 && currentPage < totalPages - 2) {
                        addPageNumber(currentPage);
                    }
                    
                    // Ellipsis si nécessaire
                    if (currentPage < totalPages - 3) {
                        const ellipsis = document.createElement('span');
                        ellipsis.className = 'pagination-ellipsis';
                        ellipsis.textContent = '...';
                        paginationNumbers.appendChild(ellipsis);
                    }
                    
                    // Dernières pages
                    for (let i = totalPages - 2; i <= totalPages; i++) {
                        if (i > 3) {
                            addPageNumber(i);
                        }
                    }
                } else {
                    // Afficher toutes les pages si peu nombreuses
                    for (let i = 1; i <= totalPages; i++) {
                        addPageNumber(i);
                    }
                }
                
                // Afficher les lignes de la page actuelle
                rows.forEach((row, index) => {
                    row.style.display = (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) ? '' : 'none';
                });
                
                // Afficher ou masquer la pagination
                document.getElementById('pagination').style.display = totalPages <= 1 ? 'none' : 'flex';
            }
            
            function addPageNumber(pageNum) {
                const pageButton = document.createElement('button');
                pageButton.className = 'pagination-number' + (pageNum === currentPage ? ' active' : '');
                pageButton.textContent = pageNum;
                pageButton.addEventListener('click', () => {
                    currentPage = pageNum;
                    updatePagination();
                });
                paginationNumbers.appendChild(pageButton);
            }
            
            // Navigation de page
            prevPageBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    updatePagination();
                }
            });
            
            nextPageBtn.addEventListener('click', () => {
                const rows = Array.from(document.querySelectorAll('#projectsTableBody tr.projet-row')).filter(row => 
                    row.style.display !== 'none' && !row.classList.contains('empty-table')
                );
                const totalPages = Math.ceil(rows.length / itemsPerPage);
                
                if (currentPage < totalPages) {
                    currentPage++;
                    updatePagination();
                }
            });
            
            // Initialiser la pagination
            updatePagination();
        }

        // Réinitialiser la pagination
        function resetPagination() {
            currentPage = 1;
            setupPagination();
        }

        // Ouvrir le modal de confirmation de suppression
        function confirmerSuppression(id) {
            document.getElementById('deleteProjectId').value = id;
            document.getElementById('deleteModal').classList.add('show');
        }

        // Fermer le modal
        function fermerModal() {
            document.getElementById('deleteModal').classList.remove('show');
        }
    </script>
</body>
</html>