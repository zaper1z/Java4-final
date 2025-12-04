package Dao;

import Entity.User;
import Utils.JpaUtils;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class UserDAOImpl implements UserDAO {

	@Override
	public User findById(String id) {
	    EntityManager em = JpaUtils.getEntityManager();
	    try { 
	    	return em.find(User.class, id); 
	    } finally {
	        em.close(); 
	    }
	}

    @Override
    public void create(User user) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user); 
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public void update(User user) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user); // Cập nhật
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(String id) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user); // Xóa
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }
    @Override
    public List<User> findAll() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u"; 
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
