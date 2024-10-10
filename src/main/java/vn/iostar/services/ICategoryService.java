package vn.iostar.services;

import java.util.List;

import vn.iostar.entity.Category;

public interface ICategoryService {
	void insert(Category category);
    void update(Category category);
    void delete(int cateid) throws Exception;
    Category findById(int cateid);
    List<Category> findAll();
    List<Category> findByCategoryname(String catname);
    List<Category> findAll(int page, int pagesize);

}
