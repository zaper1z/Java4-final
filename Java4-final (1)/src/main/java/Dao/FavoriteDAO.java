package Dao;

import Entity.Favorite;
import java.util.List;

import DTO.VideoFavoriteReport;

public interface FavoriteDAO {
    Favorite findById(Long id);
    List<Favorite> findAll();
    Favorite create(Favorite favorite);
    void update(Favorite favorite);
    void delete(Long id);


    List<Favorite> findByUser(String username);


    Favorite findByUserAndVideo(String username, String videoId);
    
    Long countAll();
    
    List<VideoFavoriteReport> reportVideoFavorites();
}
