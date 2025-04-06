document.addEventListener('DOMContentLoaded', function() {
    // Employees Chart
    const employeesCtx = document.getElementById('employeesChart').getContext('2d');
    new Chart(employeesCtx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Nombre d\'employés',
                data: [12, 19, 15, 17, 20, 25],
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Statistics Chart
    const statisticsCtx = document.getElementById('statisticsChart').getContext('2d');
    new Chart(statisticsCtx, {
        type: 'doughnut',
        data: {
            labels: ['En cours', 'Terminé', 'En attente'],
            datasets: [{
                data: [30, 50, 20],
                backgroundColor: [
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(255, 99, 132, 0.5)'
                ],
                borderColor: [
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
});
