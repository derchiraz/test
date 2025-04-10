<%-- 
    Document   : listeOP
    Created on : 10 avr. 2025, 01:30:58
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
    <title>Liste des Opportunités</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listeProjet.css">
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
                        <a href="${pageContext.request.contextPath}/dashboard" class="nav-item">
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
                        <a href="#" class="nav-item has-submenu active" id="opportunite-menu">
                            <i class="fas fa-lightbulb"></i>
                            <span>Opportunités</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu show" id="opportunite-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/opportunite/nouvelle">
                                    <i class="fas fa-plus-circle"></i> Ajouter opportunité
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/opportunite/liste" class="active">
                                    <i class="fas fa-list"></i> Liste des opportunités
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/opportunite/rapports">
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
                        <a href="${pageContext.request.contextPath}/dashboard">Accueil</a> / 
                        <a href="${pageContext.request.contextPath}/opportunite/liste">Opportunités</a> / 
                        <span>Liste des opportunités</span>
                    </div>
                    <div class="header-top">
                        <h1>Liste des Opportunités</h1>
                        <div class="header-actions">
                            <button class="btn-action" onclick="location.href='${pageContext.request.contextPath}/opportunite/nouvelle'">
                                <span class="icon"><i class="fas fa-plus"></i></span> Ajouter une Opportunité
                            </button>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <!-- Filtres et recherche -->
                <div class="filters-container">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="searchInput" placeholder="Rechercher une opportunité...">
                    </div>
                    <div class="filter-options">
                        <div class="filter-group">
                            <label for="statusFilter">Status:</label>
                            <select id="statusFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <option value="new">Nouvelle</option>
                                <option value="qualified">Qualifiée</option>
                                <option value="proposal">Proposition</option>
                                <option value="negotiation">Négociation</option>
                                <option value="closed">Clôturée</option>
                                <option value="lost">Perdue</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label for="responsableFilter">Commercial:</label>
                            <select id="responsableFilter" class="filter-select">
                                <option value="all">Tous</option>
                                <c:forEach var="commercial" items="${commerciaux}">
                                    <option value="${commercial.id}">${commercial.nom} ${commercial.prenom}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Table des opportunités -->
                <div class="table-container">
                    <table class="projects-table">
                        <thead>
                            <tr>
                                <th class="sortable" data-sort="nom">Nom opportunité <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="client">Client <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="commercial">Commercial <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="status">Status <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="dateCreation">Date création <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="dateCloture">Date clôture <i class="fas fa-sort"></i></th>
                                <th class="sortable" data-sort="montant">Montant <i class="fas fa-sort"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="opportunitesTableBody">
                            <c:choose>
                                <c:when test="${empty opportunites}">
                                    <tr class="empty-table">
                                        <td colspan="8">
                                            <div class="empty-state">
                                                <i class="fas fa-lightbulb"></i>
                                                <p>Aucune opportunité trouvée</p>
                                                <button class="btn-secondary" onclick="location.href='${pageContext.request.contextPath}/opportunite/nouvelle'">
                                                    Ajouter une opportunité
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="opportunite" items="${opportunites}">
                                        <tr class="opportunite-row" data-id="${opportunite.id}" data-status="${opportunite.status}" data-commercial="${opportunite.commercial.id}">
                                            <td class="opportunite-name">
                                                <a href="${pageContext.request.contextPath}/opportunite/details/${opportunite.id}">${opportunite.nom}</a>
                                            </td>
                                            <td>${opportunite.client.nom}</td>
                                            <td>${opportunite.commercial.nom} ${opportunite.commercial.prenom}</td>
                                            <td>
                                                <span class="status-badge status-${opportunite.status}">
                                                    <c:choose>
                                                        <c:when test="${opportunite.status eq 'new'}">Nouvelle</c:when>
                                                        <c:when test="${opportunite.status eq 'qualified'}">Qualifiée</c:when>
                                                        <c:when test="${opportunite.status eq 'proposal'}">Proposition</c:when>
                                                        <c:when test="${opportunite.status eq 'negotiation'}">Négociation</c:when>
                                                        <c:when test="${opportunite.status eq 'closed'}">Clôturée</c:when>
                                                        <c:when test="${opportunite.status eq 'lost'}">Perdue</c:when>
                                                        <c:otherwise>${opportunite.status}</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>
                                            <td><fmt:formatDate value="${opportunite.dateCreation}" pattern="dd/MM/yyyy" /></td>
                                            <td><fmt:formatDate value="${opportunite.dateCloture}" pattern="dd/MM/yyyy" /></td>
                                            <td class="montant"><fmt:formatNumber value="${opportunite.montant}" type="currency" currencySymbol="€" /></td>
                                            <td class="actions">
                                                <button class="action-btn view-btn" title="Voir" onclick="location.href='${pageContext.request.contextPath}/opportunite/details/${opportunite.id}'">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn edit-btn" title="Modifier" onclick="location.href='${pageContext.request.contextPath}/opportunite/edit/${opportunite.id}'">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="action-btn delete-btn" title="Supprimer" onclick="confirmerSuppression(${opportunite.id})">
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
                <p>Êtes-vous sûr de vouloir supprimer cette opportunité ? Cette action est irréversible.</p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" action="${pageContext.request.contextPath}/opportunite/delete" method="post">
                    <input type="hidden" id="deleteOpportuniteId" name="id">
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
                    const subId = this.id.replace('-menu', '-submenu');
                    const subMenu = document.getElementById(subId);
                    subMenu.classList.toggle('show');
                    this.classList.toggle('expanded');
                    e.preventDefault();
                });
            });

            // Configurations du tableau
            setupTableFiltering();
            setupTableSorting();
            setupPagination();
            
            // Theme toggle
            const themeToggle = document.getElementById('theme-toggle');
            themeToggle.addEventListener('click', function() {
                document.body.classList.toggle('dark-theme');
                localStorage.setItem('theme', document.body.classList.contains('dark-theme') ? 'dark' : 'light');
                this.innerHTML = document.body.classList.contains('dark-theme') ? 
                    '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
            });
            
            // Apply saved theme
            if (localStorage.getItem('theme') === 'dark') {
                document.body.classList.add('dark-theme');
                themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
            }
        });

        // Configuration du filtrage
        function setupTableFiltering() {
            const searchInput = document.getElementById('searchInput');
            const statusFilter = document.getElementById('statusFilter');
            const responsableFilter = document.getElementById('responsableFilter');
            
            function applyFilters() {
                const searchTerm = searchInput.value.toLowerCase();
                const statusValue = statusFilter.value;
                const responsableValue = responsableFilter.value;
                
                const rows = document.querySelectorAll('#opportunitesTableBody tr.opportunite-row');
                
                rows.forEach(row => {
                    if (row.classList.contains('empty-table')) return;
                    
                    const opportuniteName = row.querySelector('.opportunite-name').textContent.toLowerCase();
                    const opportuniteStatus = row.getAttribute('data-status');
                    const opportuniteResponsable = row.getAttribute('data-commercial');
                    
                    const matchesSearch = opportuniteName.includes(searchTerm);
                    const matchesStatus = statusValue === 'all' || opportuniteStatus === statusValue;
                    const matchesResponsable = responsableValue === 'all' || opportuniteResponsable === responsableValue;
                    
                    row.style.display = (matchesSearch && matchesStatus && matchesResponsable) ? '' : 'none';
                });
                
                resetPagination();
            }
            
            searchInput.addEventListener('input', applyFilters);
            statusFilter.addEventListener('change', applyFilters);
            responsableFilter.addEventListener('change', applyFilters);
        }

        // Configuration du tri
        function setupTableSorting() {
            const headers = document.querySelectorAll('.sortable');
            
            headers.forEach(header => {
                header.addEventListener('click', function() {
                    const column = this.getAttribute('data-sort');
                    const icon = this.querySelector('i');
                    
                    document.querySelectorAll('.sortable i').forEach(i => {
                        i.className = 'fas fa-sort';
                    });
                    
                    let direction = 'asc';
                    if (icon.classList.contains('fa-sort-up')) {
                        direction = 'desc';
                        icon.className = 'fas fa-sort-down';
                    } else if (icon.classList.contains('fa-sort-down')) {
                        direction = 'none';
                        icon.className = 'fas fa-sort';
                    } else {
                        icon.className = 'fas fa-sort-up';
                    }
                    
                    if (direction !== 'none') {
                        sortTable(column, direction);
                    }
                });
            });
        }

        // Fonction de tri
        function sortTable(column, direction) {
            const tbody = document.getElementById('opportunitesTableBody');
            const rows = Array.from(document.querySelectorAll('#opportunitesTableBody tr.opportunite-row'));
            
            if (rows.length === 0 || rows[0].classList.contains('empty-table')) return;
            
            rows.sort((a, b) => {
                let valueA, valueB;
                
                switch(column) {
                    case 'nom':
                        valueA = a.querySelector('td:nth-child(1)').textContent.trim().toLowerCase();
                        valueB = b.querySelector('td:nth-child(1)').textContent.trim().toLowerCase();
                        break;
                    case 'client':
                        valueA = a.querySelector('td:nth-child(2)').textContent.trim().toLowerCase();
                        valueB = b.querySelector('td:nth-child(2)').textContent.trim().toLowerCase();
                        break;
                    case 'commercial':
                        valueA = a.querySelector('td:nth-child(3)').textContent.trim().toLowerCase();
                        valueB = b.querySelector('td:nth-child(3)').textContent.trim().toLowerCase();
                        break;
                    case 'status':
                        valueA = a.querySelector('td:nth-child(4)').textContent.trim().toLowerCase();
                        valueB = b.querySelector('td:nth-child(4)').textContent.trim().toLowerCase();
                        break;
                    case 'dateCreation':
                    case 'dateCloture':
                        const dateIndex = column === 'dateCreation' ? 5 : 6;
                        const [dayA, monthA, yearA] = a.querySelector(`td:nth-child(${dateIndex})`).textContent.trim().split('/');
                        const [dayB, monthB, yearB] = b.querySelector(`td:nth-child(${dateIndex})`).textContent.trim().split('/');
                        valueA = new Date(yearA, monthA - 1, dayA);
                        valueB = new Date(yearB, monthB - 1, dayB);
                        break;
                    case 'montant':
                        valueA = parseFloat(a.querySelector('td:nth-child(7)').textContent.replace(/[^0-9.-]+/g, ''));
                        valueB = parseFloat(b.querySelector('td:nth-child(7)').textContent.replace(/[^0-9.-]+/g, ''));
                        break;
                }
                
                if (valueA < valueB) return direction === 'asc' ? -1 : 1;
                if (valueA > valueB) return direction === 'asc' ? 1 : -1;
                return 0;
            });
            
            rows.forEach(row => tbody.appendChild(row));
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
                const rows = Array.from(document.querySelectorAll('#opportunitesTableBody tr.opportunite-row')).filter(row => 
                    row.style.display !== 'none' && !row.classList.contains('empty-table')
                );
                
                const totalPages = Math.ceil(rows.length / itemsPerPage);
                
                prevPageBtn.disabled = currentPage === 1;
                nextPageBtn.disabled = currentPage === totalPages || totalPages === 0;
                
                paginationNumbers.innerHTML = '';
                
                if (totalPages > 7) {
                    for (let i = 1; i <= 3; i++) {
                        addPageNumber(i);
                    }
                    
                    if (currentPage > 4) {
                        const ellipsis = document.createElement('span');
                        ellipsis.className = 'pagination-ellipsis';
                        ellipsis.textContent = '...';
                        paginationNumbers.appendChild(ellipsis);
                    }
                    
                    if (currentPage > 3 && currentPage < totalPages - 2) {
                        addPageNumber(currentPage);
                    }
                    
                    if (currentPage < totalPages - 3) {
                        const ellipsis = document.createElement('span');
                        ellipsis.className = 'pagination-ellipsis';
                        ellipsis.textContent = '...';
                        paginationNumbers.appendChild(ellipsis);
                    }
                    
                    for (let i = totalPages - 2; i <= totalPages; i++) {
                        if (i > 3) {
                            addPageNumber(i);
                        }
                    }
                } else {
                    for (let i = 1; i <= totalPages; i++) {
                        addPageNumber(i);
                    }
                }
                
                rows.forEach((row, index) => {
                    row.style.display = (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) ? '' : 'none';
                });
                
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
            
            prevPageBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    updatePagination();
                }
            });
            
            nextPageBtn.addEventListener('click', () => {
                const rows = Array.from(document.querySelectorAll('#opportunitesTableBody tr.opportunite-row')).filter(row => 
                    row.style.display !== 'none' && !row.classList.contains('empty-table')
                );
                const totalPages = Math.ceil(rows.length / itemsPerPage);
                
                if (currentPage < totalPages) {
                    currentPage++;
                    updatePagination();
                }
            });
            
            updatePagination();
        }

        function resetPagination() {
            currentPage = 1;
            setupPagination();
        }

        function confirmerSuppression(id) {
            document.getElementById('deleteOpportuniteId').value = id;
            document.getElementById('deleteModal').classList.add('show');
        }

        function fermerModal() {
            document.getElementById('deleteModal').classList.remove('show');
        }
    </script>
</body>
</html>
