<%-- 
    Document   : coordonne
    Created on : 10 avr. 2025, 01:02:17
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mes Coordonnées</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
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
                    <li><a href="${pageContext.request.contextPath}/profil" class="active"><i class="fas fa-user"></i> Mon profil</a></li>
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
                        <a href="#" class="nav-item has-submenu" id="project-menu">
                            <i class="fas fa-project-diagram"></i>
                            <span>Projets</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="project-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/projet/nouveau">
                                    <i class="fas fa-plus-circle"></i> Ajouter projet
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/projet/liste">
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
                        <a href="${pageContext.request.contextPath}/dashboard">Accueil</a> / 
                        <a href="${pageContext.request.contextPath}/profil">Profil</a> / 
                        <span>Mes coordonnées</span>
                    </div>
                    <div class="header-top">
                        <h1>Mes Coordonnées</h1>
                        <div class="header-actions">
                            <button class="btn-action" id="edit-btn">
                                <span class="icon"><i class="fas fa-pen"></i></span> Modifier
                            </button>
                        </div>
                    </div>
                    <div class="header-divider"></div>
                </div>

                <div class="form-container">
                    <div class="row">
                        <!-- Colonne gauche - Informations -->
                        <div class="col-left">
                            <div class="form-section">
                                <h4 class="section-title">Informations Personnelles</h4>
                                <div class="input-group">
                                    <label for="nom">Nom</label>
                                    <input type="text" id="nom" name="nom" class="form-control" 
                                          value="Derghal Chiraz" disabled>
                                </div>
                                <div class="input-group">
                                    <label for="titre">Titre</label>
                                    <input type="text" id="titre" name="titre" class="form-control" 
                                          value="DEC" disabled>
                                </div>
                                <div class="input-group">
                                    <label for="service">Service</label>
                                    <input type="text" id="service" name="service" class="form-control" 
                                          value="Finance" disabled>
                                </div>
                                <div class="input-group">
                                    <label for="statut">Historique du statut</label>
                                    <input type="text" id="statut" name="statut" class="form-control" 
                                          value="Activated - 13/05/2019" disabled>
                                </div>
                            </div>
                            
                            <div class="form-section">
                                <h4 class="section-title">Coordonnées</h4>
                                <div class="input-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" class="form-control" 
                                          value="derghal.chiraz@example.com" disabled>
                                </div>
                                <div class="input-group">
                                    <label for="phone">Téléphone</label>
                                    <input type="text" id="phone" name="phone" class="form-control" 
                                          value="+1234567890" disabled>
                                </div>
                            </div>

                            <div class="btn-container" id="buttons" style="display: none;">
                                <button type="button" class="btn-secondary" onclick="cancelChanges()">Annuler</button>
                                <button type="button" class="btn-primary" onclick="confirmChanges()">
                                    <i class="fas fa-save"></i> Sauvegarder
                                </button>
                            </div>
                        </div>
                        
                        <!-- Colonne droite - Profil -->
                        <div class="col-right">
                            <div class="profile-card">
                                <div class="profile-header">
                                    <div class="profile-avatar">
                                        <span id="profile-initials">DC</span>
                                    </div>
                                    <div class="profile-info">
                                        <h3 id="profile-name">Derghal Chiraz</h3>
                                        <p id="profile-title">DEC</p>
                                    </div>
                                </div>
                                <div class="profile-stats">
                                    <div class="stat-item">
                                        <span class="stat-label">Projets</span>
                                        <span class="stat-value">12</span>
                                    </div>
                                    <div class="stat-item">
                                        <span class="stat-label">Heures</span>
                                        <span class="stat-value">128</span>
                                    </div>
                                    <div class="stat-item">
                                        <span class="stat-label">Tâches</span>
                                        <span class="stat-value">47</span>
                                    </div>
                                </div>
                                <div class="profile-actions">
                                    <a href="#" class="profile-action" onclick="openEmail()">
                                        <i class="fas fa-envelope"></i> Email
                                    </a>
                                    <a href="#" class="profile-action" onclick="openPhoneCall()">
                                        <i class="fas fa-phone"></i> Téléphone
                                    </a>
                                </div>
                                <div class="profile-links">
                                    <a href="${pageContext.request.contextPath}/timesheet/user" class="profile-link">
                                        <i class="fas fa-clock"></i> Mes feuilles de temps
                                    </a>
                                    <a href="${pageContext.request.contextPath}/cv" class="profile-link">
                                        <i class="fas fa-file-alt"></i> Mon CV
                                    </a>
                                </div>
                            </div>
                        </div>
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
                <div class="toast-message">Vos coordonnées ont été mises à jour avec succès.</div>
            </div>
            <button class="toast-close">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

    <style>
        /* Styles spécifiques pour la page des coordonnées */
        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }
        
        .col-left {
            flex: 1;
            padding: 0 15px;
            min-width: 60%;
        }
        
        .col-right {
            width: 320px;
            padding: 0 15px;
        }
        
        .profile-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .profile-header {
            padding: 20px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        
        .profile-avatar {
            width: 70px;
            height: 70px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            margin-right: 15px;
        }
        
        .profile-info h3 {
            margin: 0 0 5px;
            font-size: 18px;
        }
        
        .profile-info p {
            margin: 0;
            color: #666;
        }
        
        .profile-stats {
            display: flex;
            border-bottom: 1px solid #eee;
        }
        
        .stat-item {
            flex: 1;
            text-align: center;
            padding: 15px 0;
        }
        
        .stat-label {
            display: block;
            font-size: 12px;
            color: #666;
        }
        
        .stat-value {
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-top: 5px;
        }
        
        .profile-actions {
            display: flex;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .profile-action {
            flex: 1;
            text-align: center;
            padding: 10px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.2s;
        }
        
        .profile-action:hover {
            background: rgba(0, 123, 255, 0.1);
            border-radius: 5px;
        }
        
        .profile-links {
            padding: 10px;
        }
        
        .profile-link {
            display: block;
            padding: 10px 15px;
            color: #333;
            text-decoration: none;
            transition: all 0.2s;
            border-radius: 5px;
        }
        
        .profile-link:hover {
            background: #f5f5f5;
        }
        
        .profile-link i {
            margin-right: 8px;
            color: #007bff;
        }
        
        /* Dark Theme Overrides */
        .dark-theme .profile-card {
            background: #333;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }
        
        .dark-theme .profile-header,
        .dark-theme .profile-stats,
        .dark-theme .profile-actions {
            border-color: #444;
        }
        
        .dark-theme .profile-info h3,
        .dark-theme .stat-value {
            color: #fff;
        }
        
        .dark-theme .profile-info p,
        .dark-theme .stat-label {
            color: #aaa;
        }
        
        .dark-theme .profile-link {
            color: #ddd;
        }
        
        .dark-theme .profile-link:hover {
            background: #444;
        }
        
        /* Animation pour les champs en mode édition */
        .editable {
            border: 2px solid #007bff !important;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            animation: glow 1.5s infinite alternate;
        }
        
        @keyframes glow {
            from {
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            }
            to {
                box-shadow: 0 0 10px rgba(0, 123, 255, 0.6);
            }
        }
        
        /* Animation pour les erreurs */
        .shake {
            animation: shake 0.5s;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
        
        /* Style d'erreur */
        .error {
            border-color: #dc3545 !important;
        }
        
        .error-message {
            display: none;
            color: #dc3545;
            margin-top: 5px;
            font-size: 14px;
        }
        
        /* Responsive design */
        @media (max-width: 992px) {
            .row {
                flex-direction: column;
            }
            
            .col-right {
                width: 100%;
                margin-top: 20px;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
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

            // Bouton d'édition
            const editBtn = document.getElementById('edit-btn');
            editBtn.addEventListener('click', toggleEdit);
            
            // Toast notification
            const toast = document.getElementById('toast-success');
            const toastClose = document.querySelector('.toast-close');
            
            toastClose.addEventListener('click', function() {
                toast.classList.remove('show');
            });
            
            // Initialiser les initiales du profil
            updateProfileInitials();
        });

        // Variables globales pour stocker les valeurs originales
        let originalValues = {};

        function toggleEdit() {
            const inputs = document.querySelectorAll(".form-control");
            const buttons = document.getElementById("buttons");
            const editBtn = document.getElementById("edit-btn");

            // Si on entre en mode édition
            if (inputs[0].disabled) {
                // Sauvegarder les valeurs originales
                inputs.forEach((input) => {
                    originalValues[input.id] = input.value;
                    input.disabled = false;
                    input.classList.add("editable");
                });
                
                buttons.style.display = "flex";
                editBtn.querySelector("span.icon").innerHTML = '<i class="fas fa-times"></i>';
                editBtn.querySelector("span.icon").nextSibling.textContent = " Annuler";
            } 
            // Si on quitte le mode édition
            else {
                cancelChanges();
            }
        }

        function confirmChanges() {
            let valid = true;
            const inputs = document.querySelectorAll(".form-control");
            
            // Vérifier que tous les champs sont remplis
            inputs.forEach((input) => {
                if (input.value.trim() === "") {
                    input.classList.add('error');
                    input.classList.add('shake');
                    setTimeout(() => input.classList.remove('shake'), 500);
                    valid = false;
                } else {
                    input.classList.remove('error');
                }
            });
            
            if (!valid) return;
            
            // Désactiver les champs et mettre à jour le profil
            inputs.forEach((input) => {
                input.disabled = true;
                input.classList.remove("editable");
            });
            
            document.getElementById("buttons").style.display = "none";
            
            // Réinitialiser le bouton d'édition
            const editBtn = document.getElementById("edit-btn");
            editBtn.querySelector("span.icon").innerHTML = '<i class="fas fa-pen"></i>';
            editBtn.querySelector("span.icon").nextSibling.textContent = " Modifier";
            
            // Mettre à jour les informations du profil
            updateProfile();
            
            // Afficher un message de succès
            const toast = document.getElementById('toast-success');
            toast.classList.add('show');
            setTimeout(() => {
                toast.classList.remove('show');
            }, 5000);
        }
        
        function cancelChanges() {
            const inputs = document.querySelectorAll(".form-control");
            
            // Restaurer les valeurs originales
            inputs.forEach((input) => {
                if (originalValues[input.id]) {
                    input.value = originalValues[input.id];
                }
                input.disabled = true;
                input.classList.remove("editable");
                input.classList.remove("error");
            });
            
            document.getElementById("buttons").style.display = "none";
            
            // Réinitialiser le bouton d'édition
            const editBtn = document.getElementById("edit-btn");
            editBtn.querySelector("span.icon").innerHTML = '<i class="fas fa-pen"></i>';
            editBtn.querySelector("span.icon").nextSibling.textContent = " Modifier";
        }
        
        function updateProfile() {
            // Mettre à jour le nom et le titre dans la carte de profil
            document.getElementById("profile-name").textContent = document.getElementById("nom").value;
            document.getElementById("profile-title").textContent = document.getElementById("titre").value;
            
            // Mettre à jour les initiales
            updateProfileInitials();
        }
        
        function updateProfileInitials() {
            const nom = document.getElementById("nom").value;
            const parts = nom.split(' ');
            let initials = '';
            
            if (parts.length >= 2) {
                initials = parts[0].charAt(0) + parts[1].charAt(0);
            } else if (parts.length === 1) {
                initials = parts[0].charAt(0);
            }
            
            document.getElementById("profile-initials").textContent = initials.toUpperCase();
        }
        
        function openEmail() {
            let email = document.getElementById("email").value;
            let emailUrl = `https://mail.google.com/mail/?view=cm&fs=1&to=${email}`;
            window.open(emailUrl, "_blank");
        }

        function openPhoneCall() {
            let phone = document.getElementById("phone").value;
            window.location.href = `tel:${phone}`;
        }
    </script>
</body>
</html>