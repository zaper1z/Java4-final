// File: FavoriteVideoReport.java (Tạo mới)
package Report; // Hoặc Model

import java.util.Date;

public class FavoriteVideoReport {
    private String videoTitle;
    private Long favoriteCount; 
    private Date latestDate;
    private Date oldestDate;


    public FavoriteVideoReport(String videoTitle, Long favoriteCount, Date latestDate, Date oldestDate) {
        this.videoTitle = videoTitle;
        this.favoriteCount = favoriteCount;
        this.latestDate = latestDate;
        this.oldestDate = oldestDate;
    }


    public String getVideoTitle() {
        return videoTitle;
    }
    public Long getFavoriteCount() {
        return favoriteCount;
    }
    public Date getLatestDate() {
        return latestDate;
    }
    public Date getOldestDate() {
        return oldestDate;
    }
    
}