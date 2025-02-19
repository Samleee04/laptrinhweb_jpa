package vn.iostar.dao;
import vn.iostar.entity.Video;
import java.util.List;
public interface IVideoDao {
	void insert(Video video);
    void update(Video video);
    void delete(String videoid) throws Exception;
    Video findById(String videoid);
    List<Video> findAll();
    List<Video> findByVideoTitle(String vidtitle);
    List<Video> findAll(int page, int pagesize);
    int count();
    List<Video> findByCategoryId(int cateid);
}
