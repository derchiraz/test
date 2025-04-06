<%-- 
    Document   : newjsp
    Created on : 18 mars 2025, 00:41:39
    Author     : L13
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EADN Timex - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><span class="eadn">EADN</span> <span class="timex">Timex</span></h1>
            <h2>Enterprise d'Appui au Développement du Numérique</h2>
        </div>
        
        <div class="card">
            <h3>Bienvenue!</h3>
            <p>Connectez-vous à votre compte</p>
            
            <form action="login" method="post">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" 
                           class="form-control"
                           placeholder="exemple@gmail.com" required>
                </div>
                
                <div class="input-group">
                    <label for="password">Mot de passe</label>
                    <div class="password-container">
                        <input type="password" id="password" name="password" 
                               class="form-control" 
                               placeholder="Password" required>
                        <span class="password-toggle" onclick="togglePassword()">👁</span>
                    </div>
                    <a href="ForgotPassword.jsp" class="forgot-link">Mot de passe oublié?</a>
                </div>
                
                <button type="submit" class="btn-primary">Se connecter</button>
            </form>
            
            <p class="bottom-text">
                Vous n'avez pas de compte? <a href="signup.jsp">S'inscrire</a>
            </p>
        </div>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleButton = document.querySelector('.password-toggle');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleButton.style.opacity = '0.7';
            } else {
                passwordInput.type = 'password';
                toggleButton.style.opacity = '1';
            }
        }
    </script>
</body>
</html>