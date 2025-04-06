package com.eadn.service;

import com.eadn.entity.User;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import org.mindrot.jbcrypt.BCrypt;

@Stateless
public class UserService {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public User authenticate(String email, String password) {
        try {
            User user = findByEmail(email);
            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                return user;
            }
        } catch (NoResultException e) {
            return null;
        }
        return null;
    }
    
    public User createUser(User user) {
        if (findByEmail(user.getEmail()) != null) {
            throw new EntityExistsException("Email already exists");
        }
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        entityManager.persist(user);
        return user;
    }
    
    public User findByEmail(String email) {
        try {
            return entityManager.createQuery(
                "SELECT u FROM User u WHERE u.email = :email", 
                User.class)
                .setParameter("email", email)
                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}