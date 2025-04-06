<%-- 
    Document   : head
    Created on : 18 mars 2025, 22:33:34
    Author     : L13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="header" id="header">
    <div class="header__container">
        <a href="#" class="header__logo">
            <div class="container">
                <form action="https://www.google.com/search" class="search" id="search-bar">
                    <input type="search" placeholder="Type something..." name="q" class="search__input">
                    <div class="search__button" id="search-button">
                        <i class="ri-search-2-line search__icon"></i>
                        <i class="ri-close-line search__close"></i>
                    </div>
                </form>
            </div>
        </a>
        <button class="header__toggle" id="header-toggle">
            <i class="ri-bar-chart-horizontal-fill"></i>
        </button>
    </div>
</header>