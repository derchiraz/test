<%-- 
    Document   : sidebar
    Created on : 18 mars 2025, 22:35:12
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="sidebar" id="sidebar">
    <div class="sidebar__container">
        <div class="sidebar__user">
            <div class="profile-container" onclick="toggleMenu()">
                <img src="${pageContext.request.contextPath}/images/profile/${user.profileImage}" 
                     alt="Profile" 
                     class="profile-pic"
                     onerror="this.src='${pageContext.request.contextPath}/images/default-profile.jpg'">
            </div>

            <div class="overlay" id="overlay" onclick="closeMenu()"></div>

            <div class="dropdown-menu" id="profileMenu">
                <div class="profile-info">
                    <img src="${pageContext.request.contextPath}/images/profile/${user.profileImage}" 
                         alt="Profile"
                         >
                    <h3>${user.name}</h3>
                    <p>${user.email}</p>
                </div>
                <div class="menu-actions">
                    <button onclick="showCalendar()">📅 Ajouter un événement</button>
                    <button onclick="showEventList()">📆 Afficher mon calendrier</button>
                    <button onclick="showInfo()">📄 Mes coordonnées</button>
                    <button onclick="logout()">🚪 Se déconnecter</button>
                </div>
            </div>

            <div class="calendar-popup" id="calendarPopup">
                <h3>Ajouter un événement</h3>
                <form action="${pageContext.request.contextPath}/event/add" method="POST">
                    <input type="text" id="event" name="eventName" placeholder="Ex: Anniversaire" required>
                    <input type="date" id="date" name="eventDate" required>
                    <button type="submit">Enregistrer</button>
                    <button type="button" class="close-btn" onclick="closeCalendar()">Fermer</button>
                </form>
            </div>

            <div class="event-list" id="eventList">
                <h3>Mes Événements</h3>
                <ul id="events">
                    <c:forEach items="${userEvents}" var="event">
                        <li>
                            ${event.name} - ${event.formattedDate}
                            <form action="${pageContext.request.contextPath}/event/delete" method="POST" style="display:inline;">
                                <input type="hidden" name="eventId" value="${event.id}">
                                <button type="submit" class="delete-btn">❌</button>
                            </form>
                        </li>
                    </c:forEach>
                </ul>
                <button onclick="closeEventList()">Fermer</button>
            </div>
        </div>

        <div class="sidebar__content">
            <div>
                <h3 class="sidebar__title">MANAGE</h3>
                <div class="sidebar__list">
                    <a href="${pageContext.request.contextPath}/dashboard" class="sidebar__link active-link">
                        <i class="ri-pie-chart-2-fill"></i>
                        <span>Dashboard</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/wallet" class="sidebar__link">
                        <i class="ri-wallet-3-fill"></i>
                        <span>My Wallet</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/calendar" class="sidebar__link">
                        <i class="ri-calendar-fill"></i>
                        <span>Calendar</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/transactions" class="sidebar__link">
                        <i class="ri-arrow-up-down-line"></i>
                        <span>Recent Transactions</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/statistics" class="sidebar__link">
                        <i class="ri-bar-chart-box-fill"></i>
                        <span>Statistics</span>
                    </a>
                </div>
            </div>

            <div>
                <h3 class="sidebar__title">SETTINGS</h3>
                <div class="sidebar__list">
                    <a href="${pageContext.request.contextPath}/settings" class="sidebar__link">
                        <i class="ri-settings-3-fill"></i>
                        <span>Settings</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/messages" class="sidebar__link">
                        <i class="ri-mail-unread-fill"></i>
                        <span>My Messages</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/notifications" class="sidebar__link">
                        <i class="ri-notification-2-fill"></i>
                        <span>Notifications</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="sidebar__actions">
            <button onclick="toggleTheme()">
                <i class="ri-moon-clear-fill sidebar__link sidebar__theme" id="theme-button">
                    <span>Theme</span>
                </i>
            </button>

            <form action="${pageContext.request.contextPath}/logout" method="POST" style="display: inline;">
                <button type="submit" class="sidebar__link">
                    <i class="ri-logout-box-r-fill"></i>
                    <span>Log Out</span>
                </button>
            </form>
        </div>
    </div>
</nav>