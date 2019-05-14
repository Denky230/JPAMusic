
package persistence;

import constants.Instrument;
import entities.Sheetmusic;
import entities.User;
import exceptions.DatabaseException;
import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 *
 * @author alu2017310
 */
@Stateless
public class EJBMusic {

    @PersistenceUnit
    EntityManagerFactory emf;

    public void validateLogin(String username, String password) throws DatabaseException {
        User user = selectUserbyUsername(username);
        if (user == null || !password.equals(user.getPassword())) {
            throw new DatabaseException(DatabaseException.Errors.INVALID_LOGIN.ordinal());
        }
    }
    public void insertUser(User u) throws DatabaseException {
        EntityManager em = emf.createEntityManager();

        // Make sure User doesn't exist
        User exist = selectUserbyUsername(u.getUsername());
        if (exist != null) {
            throw new DatabaseException(DatabaseException.Errors.USER_DUPLICATED.ordinal(), u.getUsername());
        }

        // TEST --------------
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();

        Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);

        if (constraintViolations.size() > 0 ) {
        System.out.println("Constraint Violations occurred..");
        for (ConstraintViolation<User> contraints : constraintViolations) {
        System.out.println(contraints.getRootBeanClass().getSimpleName()+
        "." + contraints.getPropertyPath() + " " + contraints.getMessage());
          }
        }
        // -------------------
        
        em.persist(u);
        em.close();
    }
    public User selectUserbyUsername(String username) {
        return emf.createEntityManager().find(User.class, username);
    }

    public void insertSheet(Sheetmusic s) {
        EntityManager em = emf.createEntityManager();

        // TEST --------------
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();

        Set<ConstraintViolation<Sheetmusic>> constraintViolations = validator.validate(s);

        if (constraintViolations.size() > 0 ) {
        System.out.println("Constraint Violations occurred..");
        for (ConstraintViolation<Sheetmusic> contraints : constraintViolations) {
        System.out.println(contraints.getRootBeanClass().getSimpleName()+
        "." + contraints.getPropertyPath() + " " + contraints.getMessage());
          }
        }
        // -------------------
        
        em.persist(s);
        em.close();
    }
    public void updateSheet(Sheetmusic s) {
        emf.createEntityManager().merge(s);
    }
    public void deleteSheet(Sheetmusic s) {
        EntityManager em = emf.createEntityManager();
        
        // Make sure Sheet is ready to be removed
        if (!em.contains(s)) {
            s = em.merge(s);
        }
        
        em.remove(s);
    }
    public Sheetmusic selectSheetByID(int id) {
        return emf.createEntityManager().find(Sheetmusic.class, id);
    }
    public List<Sheetmusic> selectAllSheets() {
        return emf.createEntityManager().createNamedQuery("Sheetmusic.findAll").getResultList();
    }
    public List<Sheetmusic> selectSheetsByUser(User user) {
        return emf.createEntityManager()
                .createNamedQuery("Sheetmusic.findByOwner")
                .setParameter("owner", user)
                .getResultList();
    }
    public List<Sheetmusic> selectSheetsByInstrument(Instrument instrument) {
        return emf.createEntityManager()
                .createNamedQuery("Sheetmusic.findByInstrument")
                .setParameter("instrument", instrument.name())
                .getResultList();
    }
}