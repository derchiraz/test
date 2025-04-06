<%-- 
    Document   : singup
    Created on : 18 mars 2025, 01:09:41
    Author     : L13
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EADN Timex - Inscription</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/singup.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><span class="eadn">EADN</span> <span class="timex">Timex</span></h1>
            <h2>Enterprise d'Appui au Développement du Numérique</h2>
        </div>

        <form action="signup" method="post">
            <div class="form-container">
                <div class="form-section">
                    <h4 class="section-title">Informations Personnelles</h4>
                    <div class="input-group">
                        <label for="nom">Nom complet</label>
                        <input type="text" id="nom" name="nom" class="form-control" 
                               placeholder="Entrez votre nom" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" 
                               placeholder="exemple@gmail.com" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Mot de passe</label>
                        <div class="password-container">
                            <input type="password" id="password" name="password" 
                                   class="form-control" 
                                   placeholder="Créez votre mot de passe" required>
                            <span class="password-toggle" onclick="togglePassword()">👁</span>
                        </div>
                        <div class="password-hint">
                            Minimum 8 caractères, incluant lettres, chiffres et caractères spéciaux
                        </div>
                    </div>
                </div>
                
                <div class="form-section">
                    <h4 class="section-title">Informations Professionnelles</h4>
                    <div class="input-group">
                        <label for="service">Service</label>
                        <select id="service" name="service" class="form-control" required>
                            <option value="">Sélectionnez un service</option>
                            <option value="informatique">Informatique</option>
                            <option value="rh">Ressources Humaines</option>
                            <option value="finance">Finance</option>
                            <option value="commercial">Commercial</option>
                            <option value="production">Production</option>
                            <option value="logistique">Logistique</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="statut">Statut</label>
                        <select id="statut" name="statut" class="form-control" required>
                            <option value="">Sélectionnez un statut</option>
                            <option value="actif">Actif</option>
                            <option value="inactif">Inactif</option>
                            <option value="conge">En congé</option>
                            <option value="mission">En mission</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="date">Date</label>
                        <input type="date" id="date" name="date" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="btn-container">
                <button type="submit" class="btn-primary">S'inscrire</button>
            </div>

            <p class="bottom-text">
                Vous avez déjà un compte? <a href="login.jsp">Se connecter</a>
            </p>
        </form>
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

        // Set min date to today
        document.getElementById('date').min = new Date().toISOString().split('T')[0];
    </script>
</body>
</html>
