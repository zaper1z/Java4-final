package Dao;

import Entity.Video;
import java.util.List;

public interface VideoDAO {
    Video findById(String id);
    List<Video> findAll();
    Video create(Video video);
    void update(Video video);
    void delete(String id);


    List<Video> findSixMostViewed();
    
    Long countAll();
    
    void incrementViews(String videoId);
}