package DTO;

public class VideoFavoriteReport {
    

    private String title;
    

    private Long count;


    public VideoFavoriteReport(String title, Long count) {
        this.title = title;
        this.count = count;
    }


    public VideoFavoriteReport() {
    }



    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}