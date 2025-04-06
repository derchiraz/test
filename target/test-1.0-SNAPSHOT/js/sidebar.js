/*=============== SEARCH BAR JS ===============*/
const toggleSearch = (search, button) => {
    const searchBar = document.getElementById(search),
          searchButton = document.getElementById(button);

    searchButton.addEventListener("click", () => {
        searchBar.classList.toggle("show-search");
    });
};

/*=============== PROFILE MENU ===============*/
let events = [];

function toggleMenu() {
    document.getElementById("profileMenu").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}

function closeMenu() {
    document.getElementById("profileMenu").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}

/*=============== CALENDAR FUNCTIONS ===============*/
function showCalendar() {
    document.getElementById("calendarPopup").style.display = "block";
}

function closeCalendar() {
    document.getElementById("calendarPopup").style.display = "none";
}

function saveEvent() {
    let event = document.getElementById("event").value;
    let date = document.getElementById("date").value;
    if (event && date) {
        events.push(`${event} - ${date}`);
        closeCalendar();
    }
}

/*=============== EVENT LIST FUNCTIONS ===============*/
function showEventList() {
    let eventList = document.getElementById("events");
    eventList.innerHTML = events.map(e => `<li>${e}</li>`).join("");
    document.getElementById("eventList").style.display = "block";
}

function closeEventList() {
    document.getElementById("eventList").style.display = "none";
}

function showInfo() {
    alert("Nom : Lina\nEmail : lina.gua05@gmail.com\nAdresse : (ajoute ton info ici)");
}

/*=============== SIDEBAR FUNCTIONS ===============*/
const showSidebar = (toggleId, sidebarId, headerId, mainId) => {
    const toggle = document.getElementById(toggleId),
          sidebar = document.getElementById(sidebarId),
          header = document.getElementById(headerId),
          main = document.getElementById(mainId),
          dashboardGrid = document.querySelector('.dashboard-grid');

    if (toggle && sidebar && header && main) {
        toggle.addEventListener("click", () => {
            sidebar.classList.toggle("show-sidebar");
            header.classList.toggle("left-pd");
            main.classList.toggle("left-pd");
            
            // Add transition for dashboard grid
            if (dashboardGrid) {
                if (sidebar.classList.contains("show-sidebar")) {
                    dashboardGrid.style.width = "calc(100% - var(--nav-width))";
                    dashboardGrid.style.marginLeft = "var(--nav-width)";
                } else {
                    dashboardGrid.style.width = "100%";
                    dashboardGrid.style.marginLeft = "0";
                }
            }
        });
    }
};

/*=============== THEME FUNCTIONS ===============*/
const initTheme = () => {
    const themeButton = document.getElementById("theme-button");
    const darkTheme = "dark-theme";
    const iconTheme = "ri-sun-fill";

    const selectedTheme = localStorage.getItem("selected-theme");
    const selectedIcon = localStorage.getItem("selected-icon");

    const getCurrentTheme = () => document.body.classList.contains(darkTheme) ? "dark" : "light";
    const getCurrentIcon = () => themeButton.classList.contains(iconTheme) ? "ri-moon-clear-fill" : "ri-sun-fill";

    if (selectedTheme) {
        document.body.classList[selectedTheme === "dark" ? "add" : "remove"](darkTheme);
        themeButton.classList[selectedIcon === "ri-moon-clear-fill" ? "add" : "remove"](iconTheme);
    }

    themeButton.addEventListener("click", () => {
        document.body.classList.toggle(darkTheme);
        themeButton.classList.toggle(iconTheme);
        localStorage.setItem("selected-theme", getCurrentTheme());
        localStorage.setItem("selected-icon", getCurrentIcon());
    });
};

/*=============== INITIALIZATION ===============*/
document.addEventListener('DOMContentLoaded', () => {
    toggleSearch("search-bar", "search-button");
    showSidebar("header-toggle", "sidebar", "header", "main");
    
    const sidebarLinks = document.querySelectorAll(".sidebar__list a");
    sidebarLinks.forEach(link => {
        link.addEventListener("click", function() {
            sidebarLinks.forEach(l => l.classList.remove("active-link"));
            this.classList.add("active-link");
        });
    });
    
    initTheme();
});