<%-- 
    Document   : newjsp
    Created on : 18 mars 2025, 00:42:22
    Author     : L13
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EADN Timex - Mot de passe oublié</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><span class="eadn">EADN</span> <span class="timex">Timex</span></h1>
            <h2>Enterprise d'Appui au Développement du Numérique</h2>
        </div>
        
        <div class="card">
            <h3>Mot de passe oublié?</h3>
            <p>Entrez votre adresse email et nous vous enverrons un lien pour réinitialiser votre mot de passe.</p>
            
            <form action="forgot-password" method="post">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" 
                           id="email" 
                           name="email" 
                           class="form-control"
                           placeholder="exemple@gmail.com" 
                           required>
                </div>
                
                <button type="submit" class="btn-primary">
                    Envoyer le lien 
                </button>
            </form>
            
            <p class="bottom-text">
                Vous vous souvenez de votre mot de passe? 
                <a href="login.jsp">Se connecter</a>
            </p>
        </div>
    </div>
</body>
</html>