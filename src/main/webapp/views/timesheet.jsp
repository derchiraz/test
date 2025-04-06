<%-- 
    Document   : timesheet
    Created on : 24 mars 2025, 00:20:54
    Author     : L13
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Timesheet Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/timesheet.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>My Timesheet </h1>
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

        <div class="timesheet-container">
            <table class="timesheet-table">
                <thead>
                    <tr>
                        <th class="col-project">Project</th>
                        <th class="col-role">Role</th>
                        <th class="day-header">Mon</th>
                        <th class="day-header">Tue</th>
                        <th class="day-header">Wed</th>
                        <th class="day-header">Thu</th>
                        <th class="day-header">Fri</th>
                        <th class="day-header">Sat</th>
                        <th class="day-header">Sun</th>
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
                        <td colspan="2" class="total-label">Daily Total</td>
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
                <i class="fas fa-plus"></i> Add New Row
            </button>
        </div>

        <div class="actions">
            <button class="btn btn-secondary" onclick="resetTimesheet()">
                <i class="fas fa-undo"></i> Reset
            </button>
            <div class="right-actions">
                <button class="btn btn-primary" onclick="saveTimesheet()">
                    <i class="fas fa-save"></i> Save
                </button>
                <button class="btn btn-success" onclick="submitTimesheet()">
                    <i class="fas fa-paper-plane"></i> Submit
                </button>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/timesheet.js"></script>
</body>
</html>

