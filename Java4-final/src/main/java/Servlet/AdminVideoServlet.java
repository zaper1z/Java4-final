package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.VideoDAO;
import Dao.VideoDAOImpl;
import Entity.Video;
import Entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/videos")
public class AdminVideoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra đăng nhập và quyền admin
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null || !currentUser.getAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        VideoDAO videoDAO = new VideoDAOImpl();
        
        String action = request.getParameter("action");
        String videoId = request.getParameter("id");

        // Xử lý action "edit" - load video để sửa
        if ("edit".equals(action) && videoId != null) {
            Video video = videoDAO.findById(videoId);
            request.setAttribute("video", video);
        }

        // Lấy danh sách tất cả video
        List<Video> videos = videoDAO.findAll();
        request.setAttribute("videos", videos);

        request.getRequestDispatcher("/admin/videos.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập và quyền admin
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null || !currentUser.getAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        VideoDAO videoDAO = new VideoDAOImpl();
        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                // Tạo video mới
                Video video = new Video();
                video.setId(request.getParameter("id"));
                video.setTitle(request.getParameter("title"));
                video.setDescription(request.getParameter("description"));
                video.setPoster(request.getParameter("poster")); // Hoặc xử lý upload file
                video.setViews(0);
                video.setActive(Boolean.parseBoolean(request.getParameter("active")));

                videoDAO.create(video);
                request.setAttribute("message", "✅ Thêm video thành công!");

            } else if ("update".equals(action)) {
                // Cập nhật video
                String videoId = request.getParameter("id");
                Video video = videoDAO.findById(videoId);

                if (video != null) {
                    video.setTitle(request.getParameter("title"));
                    video.setDescription(request.getParameter("description"));
                    video.setActive(Boolean.parseBoolean(request.getParameter("active")));
                    
                    videoDAO.update(video);
                    request.setAttribute("message", "✅ Cập nhật video thành công!");
                }

            } else if ("delete".equals(action)) {
                // Xóa video
                String videoId = request.getParameter("id");
                videoDAO.delete(videoId);
                request.setAttribute("message", "✅ Xóa video thành công!");

            } else if ("reset".equals(action)) {
                // Reset form - không làm gì, chỉ redirect
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "❌ Lỗi: " + e.getMessage());
        }

        // Reload danh sách video
        doGet(request, response);
    }
}