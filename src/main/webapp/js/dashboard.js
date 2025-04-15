document.addEventListener('DOMContentLoaded', function() {
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
}