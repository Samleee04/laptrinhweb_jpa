package vn.iostar.services.impl;

import java.util.List;
import vn.iostar.dao.ICategoryDao;
import vn.iostar.dao.impl.CategoryDaoImpl;
import vn.iostar.entity.Category;
import vn.iostar.services.ICategoryService;

public class CategoryServiceImpl implements ICategoryService{
	 ICategoryDao cateDao = new CategoryDaoImpl();
	@Override
	public void insert(Category category) {
		  cateDao.insert(category);
		
	}

	@Override
	public void update(Category category) {
		  cateDao.update(category);
		
	}

	@Override
	public void delete(int cateid) throws Exception {
		cateDao.delete(cateid);
		
	}

	@Override
	public Category findById(int cateid) {
		 return cateDao.findById(cateid);
	}

	@Override
	public List<Category> findAll() {
		return cateDao.findAll();
	}

	@Override
	public List<Category> findByCategoryname(String catname) {
		return cateDao.findByCategoryname(catname);
	}

	@Override
	public List<Category> findAll(int page, int pagesize) {
		return cateDao.findAll(page, pagesize);
	}

}
