document.addEventListener('DOMContentLoaded', function() {
    initializeWeekSelector();
    updateWeekDisplay();
    calculateTotals();
});

function initializeWeekSelector() {
    const weekSelector = document.getElementById('weekSelector');
    const today = new Date();
    const firstDayOfWeek = new Date(today.setDate(today.getDate() - today.getDay() + 1));
    weekSelector.value = firstDayOfWeek.toISOString().split('T')[0];
}

function formatDate(date) {
    const d = new Date(date);
    return `${d.getDate()} / ${String(d.getMonth() + 1).padStart(2, '0')}`;
}

function formatDateHeader(date, dayName) {
    const d = new Date(date);
    return `${d.getDate()} / ${dayName}`;
}

function updateWeekDisplay() {
    const weekSelector = document.getElementById('weekSelector');
    const selectedDate = new Date(weekSelector.value);
    const weekStart = new Date(selectedDate.setDate(selectedDate.getDate() - selectedDate.getDay() + 1));
    
    updateHeaderDates(weekStart);
    updateTableDates(weekStart);
}

function updateHeaderDates(weekStart) {
    const headers = document.querySelectorAll('.day-header');
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    
    headers.forEach((header, index) => {
        const date = new Date(weekStart);
        date.setDate(date.getDate() + index);
        header.textContent = formatDateHeader(date, days[index]);
    });
}

function updateTableDates(weekStart) {
    const rows = document.querySelectorAll('#timesheetBody tr');
    rows.forEach(row => {
        const inputs = row.querySelectorAll('.hours-input');
        inputs.forEach((input, index) => {
            const date = new Date(weekStart);
            date.setDate(date.getDate() + index);
            input.setAttribute('data-date', date.toISOString().split('T')[0]);
            input.placeholder = 'hh:mm';
        });
    });
}

function addNewRow() {
    const tbody = document.getElementById('timesheetBody');
    const newRow = document.createElement('tr');
    
    newRow.innerHTML = `
         <td>
                            <div class="row-actions">
                                <button class="delete-row-btn" onclick="deleteRow(this)">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <select class="project-input">
                                    <option value="">Select Project</option>
                                    <option value="Site web">Site web</option>
                                    <option value="App game">App game</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <select class="role-input">
                                <option value="">Select Role</option>
                                <option value="Développement">Développement</option>
                                <option value="Design">Design</option>
                            </select>
                        </td>
        ${Array(7).fill('').map(() => `
            <td>
                <input type="text" 
                       class="hours-input" 
                       placeholder="hh:mm" 
                       pattern="\\d{2}:\\d{2}"
                       onchange="updateHours(this)">
            </td>
        `).join('')}
        <td class="row-total">00:00</td>
    `;
    
    tbody.appendChild(newRow);
    updateTableDates(getWeekStart());
}

function deleteRow(button) {
    const row = button.closest('tr');
    if (document.querySelectorAll('#timesheetBody tr').length > 1) {
        row.remove();
        calculateTotals();
    }
}

function getWeekStart() {
    const weekSelector = document.getElementById('weekSelector');
    const selectedDate = new Date(weekSelector.value);
    return new Date(selectedDate.setDate(selectedDate.getDate() - selectedDate.getDay() + 1));
}

function updateHours(input) {
    const timePattern = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
    if (input.value && !timePattern.test(input.value)) {
        input.value = '';
    }
    calculateTotals();
}

function calculateTotals() {
    const tbody = document.getElementById('timesheetBody');
    const rows = tbody.getElementsByTagName('tr');
    
    Array.from(rows).forEach(row => {
        let rowTotal = 0;
        const inputs = row.getElementsByClassName('hours-input');
        Array.from(inputs).forEach(input => {
            if (input.value) {
                const [hours, minutes] = input.value.split(':').map(Number);
                rowTotal += hours + minutes / 60;
            }
        });
        row.querySelector('.row-total').textContent = 
            `${Math.floor(rowTotal).toString().padStart(2, '0')}:${Math.round((rowTotal % 1) * 60).toString().padStart(2, '0')}`;
    });

    // Calculate column totals
    for (let i = 0; i < 7; i++) {
        let columnTotal = 0;
        Array.from(rows).forEach(row => {
            const input = row.getElementsByClassName('hours-input')[i];
            if (input.value) {
                const [hours, minutes] = input.value.split(':').map(Number);
                columnTotal += hours + minutes / 60;
            }
        });
        document.getElementsByClassName('column-total')[i].textContent = 
            `${Math.floor(columnTotal).toString().padStart(2, '0')}:${Math.round((columnTotal % 1) * 60).toString().padStart(2, '0')}`;
    }

    // Calculate grand total
    let grandTotal = 0;
    Array.from(rows).forEach(row => {
        const totalText = row.querySelector('.row-total').textContent;
        const [hours, minutes] = totalText.split(':').map(Number);
        grandTotal += hours + minutes / 60;
    });
    document.querySelector('.grand-total').textContent = 
        `${Math.floor(grandTotal).toString().padStart(2, '0')}:${Math.round((grandTotal % 1) * 60).toString().padStart(2, '0')}`;
}

function previousWeek() {
    const weekSelector = document.getElementById('weekSelector');
    const currentDate = new Date(weekSelector.value);
    currentDate.setDate(currentDate.getDate() - 7);
    weekSelector.value = currentDate.toISOString().split('T')[0];
    updateWeekDisplay();
}

function nextWeek() {
    const weekSelector = document.getElementById('weekSelector');
    const currentDate = new Date(weekSelector.value);
    currentDate.setDate(currentDate.getDate() + 7);
    weekSelector.value = currentDate.toISOString().split('T')[0];
    updateWeekDisplay();
}

function resetTimesheet() {
    if (confirm('Are you sure you want to reset the timesheet?')) {
        const inputs = document.getElementsByClassName('hours-input');
        Array.from(inputs).forEach(input => input.value = '');
        calculateTotals();
    }
}

function saveTimesheet() {
    const data = collectTimesheetData();
    console.log('Saving timesheet:', data);
    alert('Timesheet saved successfully!');
}

function submitTimesheet() {
    if (confirm('Are you sure you want to submit the timesheet?')) {
        const data = collectTimesheetData();
        console.log('Submitting timesheet:', data);
        alert('Timesheet submitted successfully!');
    }
}

function collectTimesheetData() {
    const rows = document.querySelectorAll('#timesheetBody tr');
    return Array.from(rows).map(row => ({
        project: row.querySelector('.project-input').value,
        role: row.querySelector('.role-input').value,
        hours: Array.from(row.querySelectorAll('.hours-input')).map(input => ({
            date: input.getAttribute('data-date'),
            time: input.value
        }))
    }));
}
