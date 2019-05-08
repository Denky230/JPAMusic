
package persistence;

import entities.Sheetmusic;
import entities.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author alu2017310
 */
@Stateless
public class EJBMusic {

    @PersistenceUnit
    EntityManagerFactory emf;

    public void validateLogin(String username, String password) {
        User user = getUserbyUsername(username);
        if (user != null && !password.equals(user.getPassword())) {
            throw new RuntimeException("Login muy mal");
        }
    }
    public User getUserbyUsername(String username) {
        return emf.createEntityManager().find(User.class, username);
    }
    public void insertUser(User u) {
        EntityManager em = emf.createEntityManager();

        // Make sure User doesn't exist
        User exist = getUserbyUsername(u.getUsername());
        if (exist != null) {
            throw new RuntimeException("Username already exists.");
        }

        em.persist(u);
        em.close();
    }

    public void insertSheet(Sheetmusic s) {
        EntityManager em = emf.createEntityManager();

        em.persist(s);
        em.close();
    }
}