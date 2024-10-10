package vn.iostar.dao.impl;
import vn.iostar.configs.JPAConfig;
import vn.iostar.dao.IVideoDao;
import vn.iostar.entity.Video;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.List;
public class VideoDaoImpl implements IVideoDao {

	@Override
	public void insert(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
	}

	@Override
	public void update(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
		
	}

	@Override
	public void delete(String videoid) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Video video = enma.find(Video.class, videoid);
            if (video != null) {
                enma.remove(video);
            } else {
                throw new Exception("Không tìm thấy");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
		
	}

	@Override
	public Video findById(String videoid) {
		EntityManager enma = JPAConfig.getEntityManager();
        return enma.find(Video.class, videoid);
	}

	@Override
	public List<Video> findAll() {
		 EntityManager enma = JPAConfig.getEntityManager();
	     TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
	     return query.getResultList();
	}

	@Override
	public List<Video> findByVideoTitle(String vidtitle) {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT v FROM Video v WHERE v.title LIKE :vidtitle";
        TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
        query.setParameter("vidtitle", "%" + vidtitle + "%");
        return query.getResultList();
	}

	@Override
	public List<Video> findAll(int page, int pagesize) {
		EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
        query.setFirstResult(page * pagesize);
        query.setMaxResults(pagesize);
        return query.getResultList();
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Video> findByCategoryId(int cateid) {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT v FROM Video v WHERE v.category.categoryId = :cateid";
        TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
        query.setParameter("cateid", cateid);
        return query.getResultList();
	}

}
