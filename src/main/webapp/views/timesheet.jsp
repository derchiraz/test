<%-- 
    Document   : timesheet
    Created on : 24 mars 2025, 00:20:54
    Author     : L13
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Timesheet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/projet.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/timesheet.css">
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
                        <a href="#" class="nav-item has-submenu" id="opportunite-menu">
                            <i class="fas fa-lightbulb"></i>
                            <span>Opportunités</span>
                            <i class="fas fa-chevron-right submenu-icon"></i>
                        </a>
                        <ul class="submenu" id="opportunite-submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/views/opportunite.jsp">
                                    <i class="fas fa-plus-circle"></i> Ajouter opportunité
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/views/listeOpportunite.jsp">
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
                        <a href="${pageContext.request.contextPath}/views/timesheet.jsp" class="nav-item active">
                            <i class="fas fa-clock"></i>
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
                        <span>Timesheet</span>
                    </div>
                    <div class="header-top">
                        <h1>Mon Timesheet</h1>
                        
                    </div>
                    <div class="header-divider"></div>
                </div>

                <div class="timesheet-container">
                    <div class="timesheet-header">
                        <div class="date-selector">
                            <button class="btn btn-nav" onclick="previousWeek()">
                                <i class="fas fa-chevron-left"></i>
                            </button>
                            <div class="date-display">
                                <input type="date" id="weekSelector" onchange="changeWeek(this)">
                                <div class="week-range" id="weekRange"></div>
                            </div>
                            <button class="btn btn-nav" onclick="nextWeek()">
                                <i class="fas fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>

                    <div class="timesheet-table-container">
                        <table class="timesheet-table">
                            <thead>
                                <tr>
                                    <th class="col-project">Projet</th>
                                    <th class="col-role">Rôle</th>
                                    <th class="day-header">Lun</th>
                                    <th class="day-header">Mar</th>
                                    <th class="day-header">Mer</th>
                                    <th class="day-header">Jeu</th>
                                    <th class="day-header">Ven</th>
                                    <th class="day-header">Sam</th>
                                    <th class="day-header">Dim</th>
                                    <th class="col-total">Total</th>
                                </tr>
                            </thead>
                            <tbody id="timesheetBody">
                                <tr>
                                    <td>
                                        <div class="row-actions">
                                            <button class="delete-row-btn" onclick="deleteRow(this)">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <select class="project-input">
                                                <option value="">Sélectionner un projet</option>
                                                <c:forEach var="projet" items="${projets}">
                                                    <option value="${projet.id}">${projet.nom}</option>
                                                </c:forEach>
                                                <option value="Site web">Site web</option>
                                                <option value="App game">App game</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <select class="role-input">
                                            <option value="">Sélectionner un rôle</option>
                                            <option value="Développement">Développement</option>
                                            <option value="Design">Design</option>
                                            <option value="Analyse">Analyse</option>
                                            <option value="Gestion">Gestion de projet</option>
                                        </select>
                                    </td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td><input type="text" class="hours-input" placeholder="hh:mm" pattern="\d{2}:\d{2}" onchange="updateHours(this)"></td>
                                    <td class="row-total">00:00</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2" class="total-label">Total journalier</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="column-total">00:00</td>
                                    <td class="grand-total">00:00</td>
                                </tr>
                            </tfoot>
                        </table>

                        <button class="add-row-btn" onclick="addNewRow()">
                            <i class="fas fa-plus"></i> Ajouter une ligne
                        </button>
                    </div>

                    <div class="actions">
                        <button class="btn btn-secondary" onclick="resetTimesheet()">
                            <i class="fas fa-undo"></i> Réinitialiser
                        </button>
                        <div class="right-actions">
                            <button class="btn btn-primary" onclick="saveTimesheet()">
                                <i class="fas fa-save"></i> Enregistrer
                            </button>
                            <button class="btn btn-success" onclick="submitTimesheet()">
                                <i class="fas fa-paper-plane"></i> Soumettre
                            </button>
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
                <div class="toast-message">Votre timesheet a été enregistré avec succès.</div>
            </div>
            <button class="toast-close">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/timesheet.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialisation du timesheet
            initializeWeekSelector();
            updateWeekDisplay();
            calculateTotals();
            
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

        function initializeWeekSelector() {
            const weekSelector = document.getElementById('weekSelector');
            const today = new Date();
            const firstDayOfWeek = new Date(today.setDate(today.getDate() - today.getDay() + 1));
            weekSelector.value = firstDayOfWeek.toISOString().split('T')[0];
            
            updateWeekRange();
        }

        function updateWeekRange() {
            const weekSelector = document.getElementById('weekSelector');
            const selectedDate = new Date(weekSelector.value);
            const weekStart = new Date(selectedDate);
            weekStart.setDate(selectedDate.getDate() - selectedDate.getDay() + 1);
            
            const weekEnd = new Date(weekStart);
            weekEnd.setDate(weekStart.getDate() + 6);
            
            const startFormatted = `${weekStart.getDate().toString().padStart(2, '0')}/${(weekStart.getMonth() + 1).toString().padStart(2, '0')}/${weekStart.getFullYear()}`;
            const endFormatted = `${weekEnd.getDate().toString().padStart(2, '0')}/${(weekEnd.getMonth() + 1).toString().padStart(2, '0')}/${weekEnd.getFullYear()}`;
            
            document.getElementById('weekRange').textContent = `${startFormatted} - ${endFormatted}`;
            
            updateHeaderDates(weekStart);
        }

        function updateHeaderDates(weekStart) {
            const headers = document.querySelectorAll('.day-header');
            const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
            
            headers.forEach((header, index) => {
                const date = new Date(weekStart);
                date.setDate(date.getDate() + index);
                header.textContent = `${date.getDate().toString().padStart(2, '0')}/${days[index]}`;
            });
        }

        function previousWeek() {
            const weekSelector = document.getElementById('weekSelector');
            const currentDate = new Date(weekSelector.value);
            currentDate.setDate(currentDate.getDate() - 7);
            weekSelector.value = currentDate.toISOString().split('T')[0];
            updateWeekRange();
        }

        function nextWeek() {
            const weekSelector = document.getElementById('weekSelector');
            const currentDate = new Date(weekSelector.value);
            currentDate.setDate(currentDate.getDate() + 7);
            weekSelector.value = currentDate.toISOString().split('T')[0];
            updateWeekRange();
        }

        function changeWeek(element) {
            updateWeekRange();
        }

        function updateHours(input) {
            const timePattern = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
            if (input.value && !timePattern.test(input.value)) {
                input.value = '';
                // Animation d'erreur
                input.classList.add('input-error');
                setTimeout(() => {
                    input.classList.remove('input-error');
                }, 500);
            }
            calculateTotals();
        }

        function addNewRow() {
            const tbody = document.getElementById('timesheetBody');
            const newRow = document.createElement('tr');
            
            
            
            tbody.appendChild(newRow);
            
            // Animation d'ajout
            newRow.classList.add('row-added');
            setTimeout(() => {
                newRow.classList.remove('row-added');
            }, 500);
        }

        function deleteRow(button) {
            const row = button.closest('tr');
            if (document.querySelectorAll('#timesheetBody tr').length > 1) {
                // Animation de suppression
                row.classList.add('row-removed');
                setTimeout(() => {
                    row.remove();
                    calculateTotals();
                }, 300);
            } else {
                // Secouer la ligne pour indiquer qu'on ne peut pas la supprimer
                row.classList.add('shake');
                setTimeout(() => {
                    row.classList.remove('shake');
                }, 500);
            }
        }

        function calculateTotals() {
            const tbody = document.getElementById('timesheetBody');
            const rows = tbody.getElementsByTagName('tr');
            
            // Calcul des totaux par ligne
            Array.from(rows).forEach(row => {
                let rowTotal = 0;
                const inputs = row.getElementsByClassName('hours-input');
                Array.from(inputs).forEach(input => {
                    if (input.value) {
                        const [hours, minutes] = input.value.split(':').map(Number);
                        rowTotal += hours + minutes / 60;
                    }
                });
                const formattedTotal = formatHours(rowTotal);
                row.querySelector('.row-total').textContent = formattedTotal;
            });

            // Calcul des totaux par colonne
            for (let i = 0; i < 7; i++) {
                let columnTotal = 0;
                Array.from(rows).forEach(row => {
                    const input = row.getElementsByClassName('hours-input')[i];
                    if (input && input.value) {
                        const [hours, minutes] = input.value.split(':').map(Number);
                        columnTotal += hours + minutes / 60;
                    }
                });
                const formattedTotal = formatHours(columnTotal);
                document.getElementsByClassName('column-total')[i].textContent = formattedTotal;
            }

            // Calcul du total général
            let grandTotal = 0;
            Array.from(rows).forEach(row => {
                const totalText = row.querySelector('.row-total').textContent;
                const [hours, minutes] = totalText.split(':').map(Number);
                grandTotal += hours + minutes / 60;
            });
            const formattedGrandTotal = formatHours(grandTotal);
            document.querySelector('.grand-total').textContent = formattedGrandTotal;
        }

        function formatHours(hours) {
            const wholeHours = Math.floor(hours);
            const minutes = Math.round((hours - wholeHours) * 60);
            return `${wholeHours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
        }

        function resetTimesheet() {
            if (confirm('Êtes-vous sûr de vouloir réinitialiser le timesheet?')) {
                const inputs = document.getElementsByClassName('hours-input');
                Array.from(inputs).forEach(input => input.value = '');
                calculateTotals();
                
                // Animation toast
                document.getElementById('toast-success').querySelector('.toast-message').textContent = 'Timesheet réinitialisé avec succès.';
                document.getElementById('toast-success').classList.add('show');
                setTimeout(() => {
                    document.getElementById('toast-success').classList.remove('show');
                }, 3000);
            }
        }

        function saveTimesheet() {
            const data = collectTimesheetData();
            console.log('Sauvegarde du timesheet:', data);
            
            // Animation toast
            document.getElementById('toast-success').querySelector('.toast-message').textContent = 'Timesheet enregistré avec succès.';
            document.getElementById('toast-success').classList.add('show');
            setTimeout(() => {
                document.getElementById('toast-success').classList.remove('show');
            }, 3000);
        }

        function submitTimesheet() {
            if (validateTimesheet()) {
                if (confirm('Êtes-vous sûr de vouloir soumettre le timesheet?')) {
                    const data = collectTimesheetData();
                    console.log('Soumission du timesheet:', data);
                    
                    // Animation toast
                    document.getElementById('toast-success').querySelector('.toast-message').textContent = 'Timesheet soumis avec succès.';
                    document.getElementById('toast-success').classList.add('show');
                    setTimeout(() => {
                        document.getElementById('toast-success').classList.remove('show');
                    }, 3000);
                }
            }
        }

        function validateTimesheet() {
            const rows = document.querySelectorAll('#timesheetBody tr');
            let isValid = true;
            
            rows.forEach(row => {
                const project = row.querySelector('.project-input').value;
                const role = row.querySelector('.role-input').value;
                
                if (!project || !role) {
                    isValid = false;
                    // Mettre en évidence les champs vides
                    if (!project) {
                        row.querySelector('.project-input').classList.add('input-error');
                        setTimeout(() => {
                            row.querySelector('.project-input').classList.remove('input-error');
                        }, 1000);
                    }
                    
                    if (!role) {
                        row.querySelector('.role-input').classList.add('input-error');
                        setTimeout(() => {
                            row.querySelector('.role-input').classList.remove('input-error');
                        }, 1000);
                    }
                }
            });
            
            if (!isValid) {
                alert('Veuillez sélectionner un projet et un rôle pour chaque ligne.');
            }
            
            return isValid;
        }

        function collectTimesheetData() {
            const weekSelector = document.getElementById('weekSelector');
            const selectedDate = new Date(weekSelector.value);
            const weekStart = new Date(selectedDate);
            weekStart.setDate(selectedDate.getDate() - selectedDate.getDay() + 1);
            
            const rows = document.querySelectorAll('#timesheetBody tr');
            return {
                weekStarting: weekStart.toISOString().split('T')[0],
                entries: Array.from(rows).map(row => {
                    const projectSelect = row.querySelector('.project-input');
                    const roleSelect = row.querySelector('.role-input');
                    
                    return {
                        projectId: projectSelect.value,
                        projectName: projectSelect.options[projectSelect.selectedIndex].text,
                        role: roleSelect.value,
                        hours: Array.from(row.querySelectorAll('.hours-input')).map((input, index) => {
                            const day = new Date(weekStart);
                            day.setDate(day.getDate() + index);
                            return {
                                date: day.toISOString().split('T')[0],
                hours: input.value || '00:00'
            };
        }),
        total: row.querySelector('.row-total').textContent
    };
})
            
            return data;
        }

        function exportTimesheet() {
            const data = collectTimesheetData();
            const weekRange = document.getElementById('weekRange').textContent;
            
            // Création d'un CSV basique
            let csvContent = `Timesheet: ${weekRange}\n\n`;
            csvContent += `Projet,Rôle,Lun,Mar,Mer,Jeu,Ven,Sam,Dim,Total\n`;
            
            data.entries.forEach(entry => {
                csvContent += `"${entry.projectName}","${entry.role}",`;
                entry.hours.forEach(day => {
                    csvContent += `"${day.hours}",`;
                });
                csvContent += `"${entry.total}"\n`;
            });
            
            // Total journalier
            csvContent += `"Total journalier",""`;
            document.querySelectorAll('.column-total').forEach(total => {
                csvContent += `,${total.textContent}`;
            });
            csvContent += `,${document.querySelector('.grand-total').textContent}\n`;
            
            // Création du fichier et téléchargement
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            const url = URL.createObjectURL(blob);
            
            link.setAttribute('href', url);
            link.setAttribute('download', `timesheet_${data.weekStarting}.csv`);
            link.style.visibility = 'hidden';
            
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            
            // Animation toast
            document.getElementById('toast-success').querySelector('.toast-message').textContent = 'Timesheet exporté avec succès.';
            document.getElementById('toast-success').classList.add('show');
            setTimeout(() => {
                document.getElementById('toast-success').classList.remove('show');
            }, 3000);
        }
        
        function updateWeekDisplay() {
            // Met à jour les numéros de jours dans les en-têtes de colonne
            const weekSelector = document.getElementById('weekSelector');
            const startDate = new Date(weekSelector.value);
            const startOfWeek = new Date(startDate);
            startOfWeek.setDate(startDate.getDate() - startDate.getDay() + 1); // Lundi
            
            const dayHeaders = document.querySelectorAll('.day-header');
            const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
            
            for (let i = 0; i < 7; i++) {
                const currentDate = new Date(startOfWeek);
                currentDate.setDate(startOfWeek.getDate() + i);
                const day = currentDate.getDate();
                dayHeaders[i].textContent = `${day} ${days[i]}`;
            }
        }
        
        // Fonction pour charger des données sauvegardées (simulation)
        function loadSavedTimesheet() {
            // Cette fonction pourrait être appelée pour charger des données de timesheet depuis le serveur
            console.log('Chargement des données timesheet...');
            
            // Exemple de simulation de chargement de données
            setTimeout(() => {
                // Ici on pourrait remplir le timesheet avec des données récupérées
                console.log('Données chargées avec succès');
            }, 1000);
        }
        
        // Fonction pour vérifier les conflits d'horaire (dépassement de 8h par jour)
        function checkTimeConflicts() {
            const columnTotals = document.querySelectorAll('.column-total');
            let hasConflicts = false;
            
            columnTotals.forEach((total, index) => {
                const [hours, minutes] = total.textContent.split(':').map(Number);
                const totalHours = hours + minutes / 60;
                
                if (totalHours > 8) {
                    hasConflicts = true;
                    // Highlight the column with too many hours
                    const dayIndex = index;
                    const inputs = document.querySelectorAll(`#timesheetBody tr td:nth-child(${dayIndex + 3}) input`);
                    
                    inputs.forEach(input => {
                        input.classList.add('input-warning');
                        setTimeout(() => {
                            input.classList.remove('input-warning');
                        }, 2000);
                    });
                    
                    total.classList.add('total-warning');
                    setTimeout(() => {
                        total.classList.remove('total-warning');
                    }, 2000);
                }
            });
            
            if (hasConflicts) {
                alert('Attention: Certains jours dépassent 8 heures de travail.');
            }
            
            return !hasConflicts;
        }
        
        // Fonction utilitaire pour convertir hh:mm en nombre décimal
        function timeToDecimal(timeStr) {
            if (!timeStr || timeStr === '') return 0;
            const [hours, minutes] = timeStr.split(':').map(Number);
            return hours + (minutes / 60);
        }
        
        // Fonction utilitaire pour convertir un nombre décimal en format hh:mm
        function decimalToTime(decimal) {
            const hours = Math.floor(decimal);
            const minutes = Math.round((decimal - hours) * 60);
            return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
        }
        
        // Préparation pour une fonction d'auto-complétion (par exemple pour compléter automatiquement les jours fériés)
        function autoFillHolidays() {
            // Cette fonction pourrait être utilisée pour remplir automatiquement les jours fériés
            const weekSelector = document.getElementById('weekSelector');
            const startDate = new Date(weekSelector.value);
            
            // Exemple fictif de jours fériés
            const holidays = [
                // Format: [mois, jour, nom]
                [1, 1, "Jour de l'An"],
                [5, 1, "Fête du Travail"],
                [7, 5, "Fête Nationale"],
                [12, 25, "Noël"]
            ];
            
            // Vérifier chaque jour de la semaine
            for (let i = 0; i < 7; i++) {
                const currentDate = new Date(startDate);
                currentDate.setDate(startDate.getDate() + i);
                
                // Vérifier si ce jour est un jour férié
                const month = currentDate.getMonth() + 1; // getMonth() retourne 0-11
                const day = currentDate.getDate();
                
                const isHoliday = holidays.some(h => h[0] === month && h[1] === day);
                
                if (isHoliday) {
                    // Marquer visuellement le jour comme férié
                    const dayHeader = document.querySelectorAll('.day-header')[i];
                    dayHeader.classList.add('holiday');
                }
            }
        }
        
        // Fonction pour verrouiller le timesheet une fois soumis
        function lockTimesheet() {
            const inputs = document.querySelectorAll('.hours-input, .project-input, .role-input');
            inputs.forEach(input => {
                input.disabled = true;
            });
            
            document.querySelectorAll('.add-row-btn, .delete-row-btn').forEach(btn => {
                btn.disabled = true;
                btn.classList.add('disabled');
            });
            
            document.getElementById('toast-success').querySelector('.toast-message').textContent = 'Timesheet verrouillé.';
            document.getElementById('toast-success').classList.add('show');
            setTimeout(() => {
                document.getElementById('toast-success').classList.remove('show');
            }, 3000);
        }
        </script>
</body>
</html>
       