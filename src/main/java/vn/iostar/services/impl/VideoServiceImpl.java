package vn.iostar.services.impl;

import java.util.List;
import vn.iostar.dao.*;
import vn.iostar.dao.impl.VideoDaoImpl;
import vn.iostar.entity.Video;
import vn.iostar.services.IVideoService;

public class VideoServiceImpl implements IVideoService{
	 IVideoDao videoDao = new VideoDaoImpl();
	@Override
	public void insert(Video video) {
		videoDao.insert(video);
		
	}

	@Override
	public void update(Video video) {
		videoDao.update(video);
		
	}

	@Override
	public void delete(String videoid) throws Exception {
		 videoDao.delete(videoid);
		
	}

	@Override
	public Video findById(String videoid) {
		 return videoDao.findById(videoid);
	}

	@Override
	public List<Video> findAll() {
		 return videoDao.findAll();
	}

	@Override
	public List<Video> findByVideoTitle(String vidtitle) {
		  return videoDao.findByVideoTitle(vidtitle);
	}

	@Override
	public List<Video> findAll(int page, int pagesize) {
		 return videoDao.findAll(page, pagesize);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Video> findByCategoryId(int cateid) {
		 return videoDao.findByCategoryId(cateid);
	}

}
