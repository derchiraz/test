<%-- 
    Document   : edit
    Created on : 13 avr. 2025, 22:43:23
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
    <title>Modifier une Opportunité</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
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
                        <a href="${pageContext.request.contextPath}/views/home.jsp" class="nav-item">
                            <i class="fas fa-home"></i>
                            <span>Accueil</span>
                        </a>
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
                                <a href="${pageContext.request.contextPath}/views/opportunite.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter opportunité
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeOpportunite.jsp" class="active">
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
                        <a href="${pageContext.request.contextPath}/views/home.jsp">Accueil</a> / 
                        <a href="${pageContext.request.contextPath}/views/listeOpportunite.jsp">Lise des Opportunités</a> / 
                        <span>Modifier</span>
                    </div>
                    <div class="header-top">
                        <h1>Modifier une Opportunité</h1>
                        <div class="header-actions">
                            <button class="btn-action" onclick="location.href='${pageContext.request.contextPath}/views/detailsOpportunite.jsp ${opportunite.id}'">
                                <span class="icon"><i class="fas fa-eye"></i></span> Voir Détails
                            </button>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <form action="${pageContext.request.contextPath}/opportunite/update" method="post" enctype="multipart/form-data" onsubmit="return validateForm(event)">
                    <!-- Identifiant caché -->
                    <input type="hidden" name="id" value="${opportunite.id}" />

                    <div class="form-container">
                        <div class="form-section">
                            <h4 class="section-title">Informations Client</h4>
                            <div class="input-group">
                                <label for="nom_entreprise">Nom entreprise</label>
                                <input type="text" id="nom_entreprise" name="nom_entreprise" value="${opportunite.nomEntreprise}" class="form-control" required>
                            </div>
                            <div class="input-group">
                                <label for="nom_contact">Nom contact</label>
                                <input type="text" id="nom_contact" name="nom_contact" value="${opportunite.nomContact}" class="form-control" required>
                            </div>
                            <div class="input-group">
                                <label for="telephone">Téléphone</label>
                                <input type="text" id="telephone" name="telephone" value="${opportunite.telephone}" class="form-control">
                            </div>
                            <div class="input-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" value="${opportunite.email}" class="form-control">
                            </div>
                            <div class="input-group">
                                <label for="adresse">Adresse</label>
                                <input type="text" id="adresse" name="adresse" value="${opportunite.adresse}" class="form-control">
                            </div>
                        </div>

                        <div class="form-section">
                            <h4 class="section-title">Détails</h4>
                            <div class="input-group">
                                <label for="nom_opportunite">Nom opportunité</label>
                                <input type="text" id="nom_opportunite" name="nom_opportunite" value="${opportunite.nomOpportunite}" class="form-control" required>
                            </div>
                            <div class="input-group">
                                <label for="description_opportunite">Description</label>
                                <textarea id="description_opportunite" name="description_opportunite" class="form-control" required>${opportunite.descriptionOpportunite}</textarea>
                            </div>
                            <div class="input-group">
                                <label for="budget_estime">Budget estimé</label>
                                <input type="number" id="budget_estime" name="budget_estime" value="${opportunite.budgetEstime}" class="form-control" required>
                            </div>
                            <div class="input-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" class="form-control" required>
                                    <option value="new" ${opportunite.status == 'new' ? 'selected' : ''}>Nouvelle</option>
                                    <option value="qualified" ${opportunite.status == 'qualified' ? 'selected' : ''}>Qualifiée</option>
                                    <option value="proposal" ${opportunite.status == 'proposal' ? 'selected' : ''}>Proposition</option>
                                    <option value="negotiation" ${opportunite.status == 'negotiation' ? 'selected' : ''}>Négociation</option>
                                    <option value="closed" ${opportunite.status == 'closed' ? 'selected' : ''}>Clôturée</option>
                                    <option value="lost" ${opportunite.status == 'lost' ? 'selected' : ''}>Perdue</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-container">
                        <div class="form-section">
                            <h4 class="section-title">Calendrier</h4>
                            <div class="input-group">
                                <label for="dateDebut">Date début</label>
                                <div class="date-input-wrapper">
                                    <input type="date" id="dateDebut" name="dateDebut" value="<fmt:formatDate value='${opportunite.dateDebut}' pattern='yyyy-MM-dd' />" class="form-control" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <label for="dateFin">Date fin</label>
                                <div class="date-input-wrapper">
                                    <input type="date" id="dateFin" name="dateFin" value="<fmt:formatDate value='${opportunite.dateFin}' pattern='yyyy-MM-dd' />" class="form-control" required>
                                </div>
                            </div>
                            <div id="error-message" class="error-message">
                                <i class="fas fa-exclamation-triangle"></i> La date de fin doit être après la date de début.
                            </div>
                        </div>

                        <div class="form-section">
                            <h4 class="section-title">Objectifs</h4>
                            <div class="input-group">
                                <label for="objectifs_principaux">Objectifs principaux</label>
                                <textarea id="objectifs_principaux" name="objectifs_principaux" class="form-control">${opportunite.objectifsPrincipaux}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-container">
                        <div class="form-section">
                            <h4 class="section-title">Architecture</h4>
                            <div class="input-group">
                                <label for="description_architecture">Description architecture</label>
                                <textarea id="description_architecture" name="description_architecture" class="form-control">${opportunite.descriptionArchitecture}</textarea>
                            </div>
                            <div class="input-group">
                                <label for="file">Fichier joint</label>
                                <input type="file" id="file" name="file" class="form-control">
                                <c:if test="${not empty opportunite.nomFichier}">
                                    <p class="file-info">Fichier actuel : <a href="${pageContext.request.contextPath}/uploads/${opportunite.nomFichier}" target="_blank">${opportunite.nomFichier}</a></p>
                                </c:if>
                            </div>
                        </div>

                        <div class="form-section">
                            <h4 class="section-title">Équipe</h4>
                            <div class="input-group">
                                <label for="responsable">Responsable</label>
                                <input type="text" id="responsable" name="responsable" value="${opportunite.responsable}" class="form-control">
                            </div>
                            <div class="input-group">
                                <label for="membre1">Membre 1</label>
                                <input type="text" id="membre1" name="membre1" value="${opportunite.membre1}" class="form-control">
                            </div>
                            <div class="input-group">
                                <label for="membre2">Membre 2</label>
                                <input type="text" id="membre2" name="membre2" value="${opportunite.membre2}" class="form-control">
                            </div>
                            <div class="input-group">
                                <label for="membre3">Membre 3</label>
                                <input type="text" id="membre3" name="membre3" value="${opportunite.membre3}" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="reset" class="btn-secondary">Annuler</button>
                        <button type="submit" class="btn-primary">
                            <i class="fas fa-save"></i> Sauvegarder
                        </button>
                    </div>
                </form>
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
                <div class="toast-message">L'opportunité a été modifiée avec succès.</div>
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
        });

        function validateForm(event) {
            event.preventDefault();
            const startDate = document.getElementById("dateDebut").value;
            const endDate = document.getElementById("dateFin").value;
            const errorMessage = document.getElementById("error-message");
            const inputs = document.querySelectorAll("input[required], select[required], textarea[required]");
            let allFilled = true;

            inputs.forEach((input) => {
                if (input.value.trim() === "") {
                    allFilled = false;
                    input.classList.add('error');
                    // Ajouter animation de secouement
                    input.classList.add('shake');
                    setTimeout(() => input.classList.remove('shake'), 500);
                } else {
                    input.classList.remove('error');
                }
            });

            if (!allFilled) {
                return false;
            }

            if (endDate && startDate && startDate > endDate) {
                errorMessage.style.display = "block";
                // Ajouter animation
                errorMessage.classList.add('shake');
                setTimeout(() => errorMessage.classList.remove('shake'), 500);
                return false;
            } else {
                errorMessage.style.display = "none";
            }

            // Soumettre le formulaire
            document.querySelector('form').submit();
            return true;
        }
    </script>
</body>
</html>