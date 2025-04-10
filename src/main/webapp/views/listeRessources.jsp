<%-- 
    Document   : listeRessources
    Created on : 9 avr. 2025, 23:58:23
    Author     : L13
--%>

<%-- 
    Document   : roussoures
    Created on : 9 avr. 2025, 23:43:00
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
    <title>Liste des Ressources</title>
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
                        <a href="#" class="nav-item has-submenu" id="project-menu">
                            <i class="fas fa-project-diagram"></i>
                            <span>Projets</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="project-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/projet.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter projet
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeProjet.jsp">
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
                        <a href="#" class="nav-item has-submenu active" id="resource-menu">
                            <i class="fas fa-users"></i>
                            <span>Ressources</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu show" id="resource-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/ressource/nouvelle">
                                    <i class="fas fa-user-plus"></i> Nouvelle ressource
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeRessource.jsp" class="active">
                                    <i class="fas fa-list"></i> Liste des ressources
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/ressource/competences">
                                    <i class="fas fa-brain"></i> Compétences
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
                        <a href="${pageContext.request.contextPath}/views/listeRessource.jsp">Ressources</a> / 
                        <span>Liste des ressources</span>
                    </div>
                    <div class="header-top">
                        <h1>Liste des Ressources</h1>
                        <div class="header-actions">
                            <button class="btn-action" onclick="location.href='${pageContext.request.contextPath}/ressource/nouvelle'">
                                <span class="icon"><i class="fas fa-plus"></i></span> Ajouter une Ressource
                            </button>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <!-- Filtres et recherche -->
                <div class="filters-container">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="searchInput" placeholder="Rechercher une ressource...">
                    </div>
                    <div class="filter-options">
                        <div class="filter-group">
                            <label for="departementFilter">Département:</label>
                            <select id="departementFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <option value="informatique">Informatique</option>
                                <option value="commercial">Commercial</option>
                                <option value="rh">Ressources Humaines</option>
                                <option value="finance">Finance</option>
                                <option value="marketing">Marketing</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label for="disponibiliteFilter">Disponibilité:</label>
                            <select id="disponibiliteFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <option value="disponible">Disponible</option>
                                <option value="partiel">Partiellement disponible</option>
                                <option value="indisponible">Indisponible</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Table des ressources -->
                <div class="table-container">
                    <table class="projects-table">
                        <thead>
                            <tr>
                                <th class="sortable" data-sort="nom">Nom <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="prenom">Prénom <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="email">Email <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="departement">Département <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="fonction">Fonction <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="disponibilite">Disponibilité <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="tauxJournalier">Taux journalier <i class="fas fa-sort"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="resourcesTableBody">
                            <c:choose>
                                <c:when test="${empty ressources}">
                                    <tr class="empty-table">
                                        <td colspan="8">
                                            <div class="empty-state">
                                                <i class="fas fa-user-friends"></i>
                                                <p>Aucune ressource trouvée</p>
                                                <button class="btn-secondary" onclick="location.href='${pageContext.request.contextPath}/ressource/nouvelle'">
                                                    Ajouter une ressource
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="ressource" items="${ressources}">
                                        <tr class="ressource-row" data-id="${ressource.id}" data-departement="${ressource.departement}" data-disponibilite="${ressource.disponibilite}">
                                            <td class="ressource-name">
                                                <a href="${pageContext.request.contextPath}/ressource/details/${ressource.id}">${ressource.nom}</a>
                                            </td>
                                            <td>${ressource.prenom}</td>
                                            <td>${ressource.email}</td>
                                            <td>${ressource.departement}</td>
                                            <td>${ressource.fonction}</td>
                                            <td>
                                                <span class="status-badge status-${ressource.disponibilite}">
                                                    <c:choose>
                                                        <c:when test="${ressource.disponibilite eq 'disponible'}">Disponible</c:when>
                                                        <c:when test="${ressource.disponibilite eq 'partiel'}">Partiellement disponible</c:when>
                                                        <c:when test="${ressource.disponibilite eq 'indisponible'}">Indisponible</c:when>
                                                        <c:otherwise>${ressource.disponibilite}</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>
                                            <td class="taux-journalier"><fmt:formatNumber value="${ressource.tauxJournalier}" type="currency" currencySymbol="€" /></td>
                                            <td class="actions">
                                                <button class="action-btn view-btn" title="Voir" onclick="location.href='${pageContext.request.contextPath}/ressource/details/${ressource.id}'">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn edit-btn" title="Modifier" onclick="location.href='${pageContext.request.contextPath}/ressource/edit/${ressource.id}'">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="action-btn delete-btn" title="Supprimer" onclick="confirmerSuppression(${ressource.id})">
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
                <p>Êtes-vous sûr de vouloir supprimer cette ressource ? Cette action est irréversible.</p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" action="${pageContext.request.contextPath}/ressource/delete" method="post">
                    <input type="hidden" id="deleteResourceId" name="id">
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
            const departementFilter = document.getElementById('departementFilter');
            const disponibiliteFilter = document.getElementById('disponibiliteFilter');
            
            // Fonction pour appliquer tous les filtres
            function applyFilters() {
                const searchTerm = searchInput.value.toLowerCase();
                const departementValue = departementFilter.value;
                const disponibiliteValue = disponibiliteFilter.value;
                
                const rows = document.querySelectorAll('#resourcesTableBody tr.ressource-row');
                
                rows.forEach(row => {
                    // Ne pas filtrer les lignes vides
                    if (row.classList.contains('empty-table')) return;
                    
                    const resourceName = row.querySelector('.ressource-name').textContent.toLowerCase();
                    const resourceEmail = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                    const searchMatch = resourceName.includes(searchTerm) || resourceEmail.includes(searchTerm);
                    
                    const resourceDepartement = row.getAttribute('data-departement');
                    const resourceDisponibilite = row.getAttribute('data-disponibilite');
                    
                    const matchesDepartement = departementValue === 'all' || resourceDepartement === departementValue;
                    const matchesDisponibilite = disponibiliteValue === 'all' || resourceDisponibilite === disponibiliteValue;
                    
                    row.style.display = (searchMatch && matchesDepartement && matchesDisponibilite) ? '' : 'none';
                });
                
                // Réinitialiser la pagination après le filtrage
                resetPagination();
            }
            
            // Écouter les événements de saisie et de changement
            searchInput.addEventListener('input', applyFilters);
            departementFilter.addEventListener('change', applyFilters);
            disponibiliteFilter.addEventListener('change', applyFilters);
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
            
            const tbody = document.getElementById('resourcesTableBody');
            const rows = Array.from(document.querySelectorAll('#resourcesTableBody tr.ressource-row'));
            
            // Ignorer si le tableau est vide
            if (rows.length === 0 || rows[0].classList.contains('empty-table')) return;
            
            // Trier les lignes
            rows.sort((a, b) => {
                let valueA, valueB;
                
                // Créer un mappage des index de colonnes
                const columnIndices = {
                    'nom': 1,
                    'prenom': 2,
                    'email': 3,
                    'departement': 4,
                    'fonction': 5,
                    'disponibilite': 6
                };
                
                // Récupérer les valeurs en fonction de la colonne
                if (column === 'nom' || column === 'prenom' || column === 'email' || column === 'departement' || column === 'fonction') {
                    valueA = a.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim().toLowerCase();
                    valueB = b.querySelector(`td:nth-child(${columnIndices[column]})`).textContent.trim().toLowerCase();
                } else if (column === 'disponibilite') {
                    valueA = a.querySelector(`td:nth-child(${columnIndices.disponibilite})`).textContent.trim().toLowerCase();
                    valueB = b.querySelector(`td:nth-child(${columnIndices.disponibilite})`).textContent.trim().toLowerCase();
                } else if (column === 'tauxJournalier') {
                    // Extraire les nombres des valeurs de taux journalier
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
                const rows = Array.from(document.querySelectorAll('#resourcesTableBody tr.ressource-row')).filter(row => 
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
                const rows = Array.from(document.querySelectorAll('#resourcesTableBody tr.ressource-row')).filter(row => 
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
            document.getElementById('deleteResourceId').value = id;
            document.getElementById('deleteModal').classList.add('show');
        }

        // Fermer le modal
        function fermerModal() {
            document.getElementById('deleteModal').classList.remove('show');
        }
    </script>
</body>
</html>